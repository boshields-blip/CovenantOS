/// A forum post in the Covenant Forum.
///
/// Maps to the `covenant_forum_posts` table in the shared Supabase project.
/// Posts are anchored to formation practices, Berean Tool sessions, or shared
/// covenantal language — not free-form chat.
class ForumPost {
  const ForumPost({
    required this.id,
    required this.authorId,
    required this.authorName,
    required this.type,
    required this.title,
    required this.body,
    required this.isPublished,
    required this.replyCount,
    required this.viewCount,
    required this.createdAt,
    this.passageRef,
    this.domainKeys = const [],
    this.toolKey,
    this.isPersonal = false,
    this.updatedAt,
  });

  factory ForumPost.fromMap(Map<String, dynamic> map) {
    return ForumPost(
      id: map['id'] as String,
      authorId: map['author_id'] as String,
      authorName: map['author_name'] as String,
      type: map['type'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      isPublished: map['is_published'] as bool? ?? true,
      replyCount: map['reply_count'] as int? ?? 0,
      viewCount: map['view_count'] as int? ?? 0,
      createdAt: DateTime.parse(map['created_at'] as String),
      passageRef: map['passage_ref'] as String?,
      domainKeys: (map['domain_keys'] as List<dynamic>?)
              ?.cast<String>()
              .toList() ??
          const [],
      toolKey: map['tool_key'] as String?,
      isPersonal: map['is_personal'] as bool? ?? false,
      updatedAt: map['updated_at'] == null
          ? null
          : DateTime.parse(map['updated_at'] as String),
    );
  }

  final String id;
  final String authorId;
  final String authorName;

  /// Post type: 'reflection', 'question', or 'discussion'.
  final String type;

  final String title;
  final String body;
  final bool isPublished;
  final int replyCount;
  final int viewCount;
  final DateTime createdAt;
  final String? passageRef;
  final List<String> domainKeys;

  /// Optional link to the CovenantOS tool that prompted the post
  /// (e.g. 'berean_tool', 'come_to_the_table').
  final String? toolKey;

  /// When true, the post is only visible to the author and elevated roles.
  final bool isPersonal;
  final DateTime? updatedAt;

  Map<String, dynamic> toInsertMap() {
    return {
      'author_name': authorName,
      'type': type,
      'title': title,
      'body': body,
      'domain_keys': domainKeys,
      if (passageRef != null) 'passage_ref': passageRef,
      if (toolKey != null) 'tool_key': toolKey,
      if (isPersonal) 'is_personal': isPersonal,
    };
  }
}

/// Valid post type values for [ForumPost.type].
abstract final class ForumPostType {
  static const String reflection = 'reflection';
  static const String question = 'question';
  static const String discussion = 'discussion';

  static const List<String> values = [reflection, question, discussion];

  static String label(String type) {
    switch (type) {
      case reflection:
        return 'Reflection';
      case question:
        return 'Question';
      case discussion:
        return 'Discussion';
      default:
        return type;
    }
  }
}
