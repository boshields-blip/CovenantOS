import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Entry screen for the Covenant Forum.
///
/// Presents a brief orientation and navigates to `ForumPostListScreen` where
/// community posts and discussions are listed. The forum is formation-first:
/// threads are anchored to practices, Berean sessions, or covenantal language
/// — not free-form chat.
///
/// This screen is the navigation hub; the actual post list lives at
/// `/covenant/forum/posts`.
class CovenantForumHomeScreen extends StatelessWidget {
  const CovenantForumHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Covenant Forum')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Community Formation Dialogue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'The Covenant Forum is a space for formation groups to share '
              'reflections, raise questions, and dialogue around shared texts '
              'and practices. It extends the formation work beyond scheduled '
              'gatherings into ongoing community.',
            ),
            const SizedBox(height: 24),
            const _ForumPrinciple(
              label: 'Formation-first',
              description:
                  'Threads are anchored to formation practices, Berean '
                  'Tool sessions, or shared covenantal language — not free-form '
                  'chat.',
            ),
            const _ForumPrinciple(
              label: 'Group-scoped',
              description:
                  'Threads belong to a formation group. Only members of '
                  'the group see its threads by default.',
            ),
            const _ForumPrinciple(
              label: 'Covenant-held',
              description:
                  'Dialogue is held by the covenant, not by algorithm. '
                  'There are no likes, no feeds, no engagement loops.',
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.push('/covenant/forum/posts'),
              icon: const Icon(Icons.forum),
              label: const Text('Enter Forum'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForumPrinciple extends StatelessWidget {
  const _ForumPrinciple({
    required this.label,
    required this.description,
  });

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(child: Text(description)),
        ],
      ),
    );
  }
}
