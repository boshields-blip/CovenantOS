import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/services/supabase_service.dart';
import '../../domain/models/forum_post.dart';
import '../../domain/models/forum_reply.dart';

/// Data access for the Covenant Forum.
///
/// Reads published posts visible to the current user and their replies. Write
/// access for replies is enforced server-side via RLS: only users with the
/// 'responder', 'teacher', 'elder', or 'admin' covenant forum role may insert
/// replies. A [ForumPermissionException] is thrown when the server rejects a
/// write due to insufficient role.
///
/// When [AppConfig.isConfigured] is false (no Supabase env vars), all reads
/// return empty lists and writes return offline placeholders.
///
/// Tables used:
///   covenant_forum_posts   — reflection papers, questions, and discussions
///   covenant_forum_replies — responses from elevated roles
class ForumRepository {
  const ForumRepository();

  SupabaseClient get _client => SupabaseService.client;

  // ── Posts ─────────────────────────────────────────────────────────────────

  /// Returns all published, non-personal posts, newest first.
  ///
  /// Personal posts (is_personal = true) that belong to the current user are
  /// also included by Supabase RLS; however, other users' personal posts are
  /// filtered server-side.
  Future<List<ForumPost>> fetchPosts() async {
    if (!AppConfig.isConfigured) return const [];

    final rows = await _client
        .from('covenant_forum_posts')
        .select()
        .eq('is_published', true)
        .order('created_at', ascending: false) as List<dynamic>;

    return rows
        .cast<Map<String, dynamic>>()
        .map(ForumPost.fromMap)
        .toList();
  }

  /// Creates a new forum post and returns the persisted record.
  ///
  /// [authorName] is the display name stored denormalized on the post.
  Future<ForumPost> createPost({
    required String authorName,
    required String type,
    required String title,
    required String body,
    String? passageRef,
    List<String> domainKeys = const [],
    String? toolKey,
    bool isPersonal = false,
  }) async {
    if (!AppConfig.isConfigured) {
      return ForumPost(
        id: 'offline',
        authorId: 'offline',
        authorName: authorName,
        type: type,
        title: title,
        body: body,
        isPublished: true,
        replyCount: 0,
        viewCount: 0,
        createdAt: DateTime.now(),
        passageRef: passageRef,
        domainKeys: domainKeys,
        toolKey: toolKey,
        isPersonal: isPersonal,
      );
    }

    final inserted = await _client
        .from('covenant_forum_posts')
        .insert(
          ForumPost(
            id: '',
            authorId: '',
            authorName: authorName,
            type: type,
            title: title,
            body: body,
            isPublished: true,
            replyCount: 0,
            viewCount: 0,
            createdAt: DateTime.now(),
            passageRef: passageRef,
            domainKeys: domainKeys,
            toolKey: toolKey,
            isPersonal: isPersonal,
          ).toInsertMap(),
        )
        .select()
        .single();

    return ForumPost.fromMap(inserted);
  }

  // ── Replies ───────────────────────────────────────────────────────────────

  /// Returns all replies for [postId], oldest first.
  Future<List<ForumReply>> fetchReplies(String postId) async {
    if (!AppConfig.isConfigured) return const [];

    final rows = await _client
        .from('covenant_forum_replies')
        .select()
        .eq('post_id', postId)
        .order('created_at') as List<dynamic>;

    return rows
        .cast<Map<String, dynamic>>()
        .map(ForumReply.fromMap)
        .toList();
  }

  /// Adds a reply to [postId].
  ///
  /// The server enforces that the calling user holds an elevated forum role
  /// ('responder', 'teacher', 'elder', or 'admin'). A [ForumPermissionException]
  /// is thrown when this check fails.
  Future<ForumReply> createReply({
    required String postId,
    required String authorName,
    required String body,
  }) async {
    if (!AppConfig.isConfigured) {
      return ForumReply(
        id: 'offline',
        postId: postId,
        authorId: 'offline',
        authorName: authorName,
        body: body,
        isEndorsed: false,
        createdAt: DateTime.now(),
      );
    }

    try {
      final inserted = await _client
          .from('covenant_forum_replies')
          .insert(
            ForumReply(
              id: '',
              postId: postId,
              authorId: '',
              authorName: authorName,
              body: body,
              isEndorsed: false,
              createdAt: DateTime.now(),
            ).toInsertMap(),
          )
          .select()
          .single();

      return ForumReply.fromMap(inserted);
    } on PostgrestException catch (e) {
      if (e.code == '42501' || (e.message.contains('policy'))) {
        throw const ForumPermissionException();
      }
      rethrow;
    }
  }
}

/// Thrown when the current user lacks the forum role required to perform
/// the requested write operation (e.g. creating a reply without an elevated
/// role).
class ForumPermissionException implements Exception {
  const ForumPermissionException();

  @override
  String toString() =>
      'ForumPermissionException: insufficient forum role for this action.';
}
