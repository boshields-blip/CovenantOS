import 'package:covenant_os/features/covenant_forum/data/repositories/forum_repository.dart';
import 'package:covenant_os/features/covenant_forum/domain/models/forum_post.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Unit tests for ForumRepository in offline/unconfigured mode.
// ---------------------------------------------------------------------------

void main() {
  group('ForumRepository — offline/unconfigured guard', () {
    const repo = ForumRepository();

    test('fetchPosts returns empty list when not configured', () async {
      final posts = await repo.fetchPosts();
      expect(posts, isEmpty);
    });

    test('createPost returns offline placeholder when not configured',
        () async {
      final post = await repo.createPost(
        authorName: 'Alice',
        type: ForumPostType.reflection,
        title: 'A test reflection',
        body: 'Body text here.',
      );

      expect(post.id, 'offline');
      expect(post.authorName, 'Alice');
      expect(post.type, ForumPostType.reflection);
      expect(post.title, 'A test reflection');
      expect(post.body, 'Body text here.');
      expect(post.isPublished, isTrue);
    });

    test('createPost preserves optional fields in offline mode', () async {
      final post = await repo.createPost(
        authorName: 'Bob',
        type: ForumPostType.question,
        title: 'A question',
        body: 'Body.',
        passageRef: 'Romans 12:1',
        domainKeys: ['anthropology'],
        toolKey: 'berean_tool',
        isPersonal: true,
      );

      expect(post.passageRef, 'Romans 12:1');
      expect(post.domainKeys, ['anthropology']);
      expect(post.toolKey, 'berean_tool');
      expect(post.isPersonal, isTrue);
    });

    test('fetchReplies returns empty list when not configured', () async {
      final replies = await repo.fetchReplies('any-post-id');
      expect(replies, isEmpty);
    });

    test('createReply returns offline placeholder when not configured',
        () async {
      final reply = await repo.createReply(
        postId: 'post1',
        authorName: 'Elder Carl',
        body: 'A thoughtful reply.',
      );

      expect(reply.id, 'offline');
      expect(reply.postId, 'post1');
      expect(reply.authorName, 'Elder Carl');
      expect(reply.body, 'A thoughtful reply.');
      expect(reply.isEndorsed, isFalse);
    });
  });

  group('ForumPermissionException', () {
    test('toString returns a descriptive message', () {
      const ex = ForumPermissionException();
      expect(ex.toString(), contains('ForumPermissionException'));
      expect(ex.toString(), contains('forum role'));
    });
  });
}
