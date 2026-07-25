/// A reply to a forum post in the Covenant Forum.
///
/// Maps to the `covenant_forum_replies` table in the shared Supabase project.
/// Replies may only be created by users with the 'responder', 'teacher',
/// 'elder', or 'admin' forum role — this is enforced by RLS on the server.
class ForumReply {
  const ForumReply({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.authorName,
    required this.body,
    required this.isEndorsed,
    required this.createdAt,
    this.endorsedBy,
    this.updatedAt,
  });

  factory ForumReply.fromMap(Map<String, dynamic> map) {
    return ForumReply(
      id: map['id'] as String,
      postId: map['post_id'] as String,
      authorId: map['author_id'] as String,
      authorName: map['author_name'] as String,
      body: map['body'] as String,
      isEndorsed: map['is_endorsed'] as bool? ?? false,
      createdAt: DateTime.parse(map['created_at'] as String),
      endorsedBy: map['endorsed_by'] as String?,
      updatedAt: map['updated_at'] == null
          ? null
          : DateTime.parse(map['updated_at'] as String),
    );
  }

  final String id;
  final String postId;
  final String authorId;
  final String authorName;
  final String body;
  final bool isEndorsed;
  final DateTime createdAt;
  final String? endorsedBy;
  final DateTime? updatedAt;

  Map<String, dynamic> toInsertMap() {
    return {
      'post_id': postId,
      'author_name': authorName,
      'body': body,
    };
  }
}
