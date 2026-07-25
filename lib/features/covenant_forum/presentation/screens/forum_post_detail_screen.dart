import 'package:flutter/material.dart';

import '../../data/repositories/forum_repository.dart';
import '../../domain/models/forum_post.dart';
import '../../domain/models/forum_reply.dart';

/// Shows the full body of a forum post together with its replies.
///
/// Authenticated users with an elevated covenant forum role ('responder',
/// 'teacher', 'elder', 'admin') may add a reply via the bottom input bar.
/// The server enforces the role requirement via RLS; if the user lacks the
/// necessary role, a [ForumPermissionException] is raised and surfaced as an
/// error message.
class ForumPostDetailScreen extends StatefulWidget {
  const ForumPostDetailScreen({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  State<ForumPostDetailScreen> createState() => _ForumPostDetailScreenState();
}

class _ForumPostDetailScreenState extends State<ForumPostDetailScreen> {
  final _repository = const ForumRepository();
  final _replyController = TextEditingController();
  final _scrollController = ScrollController();

  ForumPost? _post;
  List<ForumReply>? _replies;
  String? _errorMessage;
  bool _submittingReply = false;
  String? _replyError;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _replyController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final posts = await _repository.fetchPosts();
      final post = posts.where((p) => p.id == widget.postId).firstOrNull;
      final replies = await _repository.fetchReplies(widget.postId);
      if (mounted) {
        setState(() {
          _post = post;
          _replies = replies;
          _errorMessage = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'Unable to load post.');
      }
    }
  }

  Future<void> _submitReply() async {
    final body = _replyController.text.trim();
    if (body.isEmpty) return;

    setState(() {
      _submittingReply = true;
      _replyError = null;
    });

    try {
      await _repository.createReply(
        postId: widget.postId,
        authorName: 'Me',
        body: body,
      );
      _replyController.clear();
      await _load();
      if (mounted && _scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    } on ForumPermissionException {
      setState(() => _replyError =
          'You need an elevated forum role to reply. Contact your group admin.');
    } catch (_) {
      setState(() => _replyError = 'Unable to post reply. Please try again.');
    } finally {
      if (mounted) setState(() => _submittingReply = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_errorMessage!),
              const SizedBox(height: 8),
              TextButton(onPressed: _load, child: const Text('Retry')),
            ],
          ),
        ),
      );
    }

    if (_post == null || _replies == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(ForumPostType.label(_post!.type)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(24),
              children: [
                _PostBody(post: _post!),
                const SizedBox(height: 24),
                if (_replies!.isNotEmpty) ...[
                  Text(
                    '${_replies!.length} ${_replies!.length == 1 ? 'Reply' : 'Replies'}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  ..._replies!.map((r) => _ReplyCard(reply: r)),
                ] else ...[
                  Text(
                    'No replies yet.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
          _ReplyInput(
            controller: _replyController,
            errorMessage: _replyError,
            submitting: _submittingReply,
            onSubmit: _submitReply,
          ),
        ],
      ),
    );
  }
}

class _PostBody extends StatelessWidget {
  const _PostBody({required this.post});

  final ForumPost post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          '${post.authorName} · ${ForumPostType.label(post.type)}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        if (post.passageRef != null) ...[
          const SizedBox(height: 4),
          Text(
            post.passageRef!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Text(post.body, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _ReplyCard extends StatelessWidget {
  const _ReplyCard({required this.reply});

  final ForumReply reply;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  reply.authorName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (reply.isEndorsed) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.verified, size: 14, color: Colors.green),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Text(reply.body, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _ReplyInput extends StatelessWidget {
  const _ReplyInput({
    required this.controller,
    required this.errorMessage,
    required this.submitting,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final String? errorMessage;
  final bool submitting;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Add a reply…',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => onSubmit(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: submitting ? null : onSubmit,
                  icon: submitting
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
