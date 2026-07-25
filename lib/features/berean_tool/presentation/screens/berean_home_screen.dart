import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Entry screen for the Berean Tool — scripture and text examination.
///
/// The Berean Tool provides structured approaches to engaging primary sources:
/// observation-interpretation-application templates, close reading prompts,
/// cross-reference tools, and group examination formats. It is named after the
/// Bereans of Acts 17 who examined the scriptures daily.
///
/// This screen explains the OIA method and navigates to the session list and
/// session creation form.
class BereanHomeScreen extends StatelessWidget {
  const BereanHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berean Tool')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scripture and Text Examination',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'The Berean Tool provides structured frameworks for engaging '
              'primary sources — primarily scripture, but also other formative '
              'texts. The method slows reading down to notice what a text '
              'actually says before drawing conclusions.',
            ),
            const SizedBox(height: 24),
            const _MethodStep(
              label: 'Observe',
              description: 'What does the text actually say? '
                  'Name only what is present — no interpretation yet.',
            ),
            const _MethodStep(
              label: 'Interpret',
              description:
                  'What does the text mean in its original context? '
                  'What do other passages say about the same subject?',
            ),
            const _MethodStep(
              label: 'Apply',
              description:
                  'How does this text form us? What claim does it make '
                  'on our lives?',
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.push('/covenant/berean/sessions/new'),
              icon: const Icon(Icons.add),
              label: const Text('Start New Session'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => context.push('/covenant/berean/sessions'),
              icon: const Icon(Icons.list),
              label: const Text('View My Sessions'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MethodStep extends StatelessWidget {
  const _MethodStep({required this.label, required this.description});

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
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
