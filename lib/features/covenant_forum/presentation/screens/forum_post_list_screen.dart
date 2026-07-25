import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/forum_repository.dart';
import '../../domain/models/forum_post.dart';

/// Displays the list of published Covenant Forum posts.
///
/// Posts are loaded from [ForumRepository.fetchPosts]. In offline/demo mode
/// the list is empty; the "New Post" button is still active so the flow can
/// be explored without a backend.
class ForumPostListScreen extends StatefulWidget {
  const ForumPostListScreen({super.key});

  @override
  State<ForumPostListScreen> createState() => _ForumPostListScreenState();
}

class _ForumPostListScreenState extends State<ForumPostListScreen> {
  final _repository = const ForumRepository();

  List<ForumPost>? _posts;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final posts = await _repository.fetchPosts();
      if (mounted) {
        setState(() {
          _posts = posts;
          _errorMessage = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'Unable to load posts.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Covenant Forum')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/covenant/forum/posts/new');
          _load();
        },
        icon: const Icon(Icons.edit),
        label: const Text('New Post'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_errorMessage!),
            const SizedBox(height: 8),
            TextButton(onPressed: _load, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_posts == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_posts!.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No posts yet. Be the first to share a reflection.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 88),
        itemCount: _posts!.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final post = _posts![index];
          return _PostTile(
            post: post,
            onTap: () async {
              await context.push('/covenant/forum/posts/${post.id}');
              _load();
            },
          );
        },
      ),
    );
  }
}

class _PostTile extends StatelessWidget {
  const _PostTile({required this.post, required this.onTap});

  final ForumPost post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final typeLabel = ForumPostType.label(post.type);
    final date = post.createdAt;
    final dateLabel =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    return ListTile(
      onTap: onTap,
      title: Text(
        post.title,
        style: const TextStyle(fontWeight: FontWeight.w600),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text('$typeLabel · ${post.authorName} · $dateLabel'),
      trailing: post.replyCount > 0
          ? Chip(
              label: Text('${post.replyCount}'),
              avatar: const Icon(Icons.chat_bubble_outline, size: 14),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
            )
          : null,
    );
  }
}
