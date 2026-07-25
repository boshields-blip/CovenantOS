import 'package:covenant_os/features/covenant_forum/domain/models/forum_post.dart';
import 'package:covenant_os/features/covenant_forum/domain/models/forum_reply.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForumPost', () {
    test('fromMap parses required fields', () {
      final map = {
        'id': 'post1',
        'author_id': 'user1',
        'author_name': 'Alice',
        'type': 'reflection',
        'title': 'On covenant community',
        'body': 'The text invites us to...',
        'is_published': true,
        'reply_count': 3,
        'view_count': 12,
        'created_at': '2026-07-25T10:00:00.000Z',
      };

      final post = ForumPost.fromMap(map);

      expect(post.id, 'post1');
      expect(post.authorId, 'user1');
      expect(post.authorName, 'Alice');
      expect(post.type, 'reflection');
      expect(post.title, 'On covenant community');
      expect(post.replyCount, 3);
      expect(post.viewCount, 12);
      expect(post.domainKeys, isEmpty);
      expect(post.isPersonal, isFalse);
      expect(post.passageRef, isNull);
      expect(post.toolKey, isNull);
    });

    test('fromMap parses optional fields', () {
      final map = {
        'id': 'post2',
        'author_id': 'user2',
        'author_name': 'Bob',
        'type': 'question',
        'title': 'Expressive individualism',
        'body': 'How does this affect worship?',
        'is_published': true,
        'reply_count': 0,
        'view_count': 0,
        'created_at': '2026-07-25T10:00:00.000Z',
        'passage_ref': 'Romans 12:1-2',
        'domain_keys': ['anthropology', 'worship'],
        'tool_key': 'berean_tool',
        'is_personal': true,
      };

      final post = ForumPost.fromMap(map);

      expect(post.passageRef, 'Romans 12:1-2');
      expect(post.domainKeys, ['anthropology', 'worship']);
      expect(post.toolKey, 'berean_tool');
      expect(post.isPersonal, isTrue);
    });

    test('toInsertMap includes mandatory fields', () {
      final post = ForumPost(
        id: '',
        authorId: '',
        authorName: 'Alice',
        type: 'reflection',
        title: 'A reflection',
        body: 'Body text',
        isPublished: true,
        replyCount: 0,
        viewCount: 0,
        createdAt: DateTime(2026),
      );

      final map = post.toInsertMap();

      expect(map['author_name'], 'Alice');
      expect(map['type'], 'reflection');
      expect(map['title'], 'A reflection');
      expect(map['body'], 'Body text');
      expect(map.containsKey('passage_ref'), isFalse);
    });
  });

  group('ForumPostType', () {
    test('values list contains all three types', () {
      expect(ForumPostType.values, containsAll(['reflection', 'question', 'discussion']));
    });

    test('label returns human-readable string for each type', () {
      expect(ForumPostType.label('reflection'), 'Reflection');
      expect(ForumPostType.label('question'), 'Question');
      expect(ForumPostType.label('discussion'), 'Discussion');
    });

    test('label returns raw value for unknown type', () {
      expect(ForumPostType.label('unknown'), 'unknown');
    });
  });

  group('ForumReply', () {
    test('fromMap parses all fields', () {
      final map = {
        'id': 'reply1',
        'post_id': 'post1',
        'author_id': 'user3',
        'author_name': 'Elder Bob',
        'body': 'The text speaks to formation through...',
        'is_endorsed': true,
        'endorsed_by': 'user_admin',
        'created_at': '2026-07-25T11:00:00.000Z',
        'updated_at': null,
      };

      final reply = ForumReply.fromMap(map);

      expect(reply.id, 'reply1');
      expect(reply.postId, 'post1');
      expect(reply.authorId, 'user3');
      expect(reply.authorName, 'Elder Bob');
      expect(reply.isEndorsed, isTrue);
      expect(reply.endorsedBy, 'user_admin');
      expect(reply.updatedAt, isNull);
    });

    test('toInsertMap includes required fields only', () {
      final reply = ForumReply(
        id: '',
        postId: 'post1',
        authorId: '',
        authorName: 'Elder Bob',
        body: 'A thoughtful response.',
        isEndorsed: false,
        createdAt: DateTime.now(),
      );

      final map = reply.toInsertMap();

      expect(map['post_id'], 'post1');
      expect(map['author_name'], 'Elder Bob');
      expect(map['body'], 'A thoughtful response.');
    });
  });
}
