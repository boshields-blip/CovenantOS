import 'package:flutter/material.dart';

/// Entry screen for the Covenant Forum — community discussion and formation
/// dialogue.
///
/// The Covenant Forum surfaces shared formation dialogue across groups.
/// It is a cross-cutting surface: it may reference any of the five formation
/// layers but is not itself a numbered layer.
///
/// Full forum thread management (posts, replies, group-scoped threads) is
/// planned for a subsequent slice. This screen provides the Slice A navigation
/// entry point and a concise orientation to the forum's purpose.
///
/// TODO(next-slice): Add ForumThread model, ForumRepository, and thread
/// listing/reply screens. Tracking: CovenantOS Slice B.
class CovenantForumHomeScreen extends StatelessWidget {
  const CovenantForumHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Covenant Forum')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Community Formation Dialogue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The Covenant Forum is a space for formation groups to share '
              'reflections, raise questions, and dialogue around shared texts '
              'and practices. It extends the formation work beyond scheduled '
              'gatherings into ongoing community.',
            ),
            SizedBox(height: 24),
            _ForumPrinciple(
              label: 'Formation-first',
              description:
                  'Threads are anchored to formation practices, Berean '
                  'Tool sessions, or shared covenantal language — not free-form '
                  'chat.',
            ),
            _ForumPrinciple(
              label: 'Group-scoped',
              description:
                  'Threads belong to a formation group. Only members of '
                  'the group see its threads by default.',
            ),
            _ForumPrinciple(
              label: 'Covenant-held',
              description:
                  'Dialogue is held by the covenant, not by algorithm. '
                  'There are no likes, no feeds, no engagement loops.',
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                'Forum thread management coming in next slice.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
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
