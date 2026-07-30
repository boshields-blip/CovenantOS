import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/forum_repository.dart';
import '../../domain/models/forum_post.dart';

/// Form screen for composing a new Covenant Forum post.
///
/// Collects post type (reflection/question/discussion), title, body, and an
/// optional passage reference. On submit, calls [ForumRepository.createPost]
/// and pops back to the post list.
class ForumPostFormScreen extends StatefulWidget {
  const ForumPostFormScreen({super.key});

  @override
  State<ForumPostFormScreen> createState() => _ForumPostFormScreenState();
}

class _ForumPostFormScreenState extends State<ForumPostFormScreen> {
  final _repository = const ForumRepository();
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _passageController = TextEditingController();

  String _type = ForumPostType.reflection;
  bool _submitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _passageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _submitting = true;
      _errorMessage = null;
    });

    try {
      await _repository.createPost(
        authorName: 'Me',
        type: _type,
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(),
        passageRef: _passageController.text.trim().isEmpty
            ? null
            : _passageController.text.trim(),
      );

      if (!mounted) return;
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _submitting = false;
        _errorMessage = 'Unable to create post. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Text('Type', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: ForumPostType.values
                  .map(
                    (t) => ButtonSegment(
                      value: t,
                      label: Text(ForumPostType.label(t)),
                    ),
                  )
                  .toList(),
              selected: {_type},
              onSelectionChanged: (s) => setState(() => _type = s.first),
            ),
            const SizedBox(height: 24),
            Text('Title', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Title is required.' : null,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            Text('Passage (optional)',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passageController,
              decoration: const InputDecoration(
                hintText: 'e.g. Matthew 5:3–12',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            Text('Body', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            TextFormField(
              controller: _bodyController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              maxLines: 8,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Body is required.' : null,
            ),
            const SizedBox(height: 32),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: 16),
            ],
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: _submitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Publish Post'),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
