import 'package:flutter/material.dart';

/// Entry screen for the Berean Tool — scripture and text examination.
///
/// The Berean Tool provides structured approaches to engaging primary sources:
/// observation-interpretation-application templates, close reading prompts,
/// cross-reference tools, and group examination formats. It is named after the
/// Bereans of Acts 17 who examined the scriptures daily.
///
/// Full Berean Tool sessions (BereanSession model, repository, and session
/// detail screen) are planned for a subsequent slice. This screen provides
/// the Slice A navigation entry point.
class BereanHomeScreen extends StatelessWidget {
  const BereanHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berean Tool')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scripture and Text Examination',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The Berean Tool provides structured frameworks for engaging '
              'primary sources — primarily scripture, but also other formative '
              'texts. The method slows reading down to notice what a text '
              'actually says before drawing conclusions.',
            ),
            SizedBox(height: 24),
            _MethodStep(
              label: 'Observe',
              description: 'What does the text actually say? '
                  'Name only what is present — no interpretation yet.',
            ),
            _MethodStep(
              label: 'Interpret',
              description:
                  'What does the text mean in its original context? '
                  'What do other passages say about the same subject?',
            ),
            _MethodStep(
              label: 'Apply',
              description:
                  'How does this text form us? What claim does it make '
                  'on our lives?',
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                'Session management coming in next slice.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MethodStep extends StatelessWidget {
  const _MethodStep({super.key, required this.label, required this.description});

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
