import 'package:flutter/material.dart';

/// Screen presenting the Come to the Table formation practice.
///
/// Come to the Table is a liturgical and relational practice for community
/// gathering, examination, and recommitment. The practice is documented in
/// detail in [covenant_os/05_formation_layer/come_to_the_table/].
///
/// This screen serves as the runtime surface for facilitating a session.
/// Session logging is available via the log button.
class ComeToTheTableScreen extends StatelessWidget {
  const ComeToTheTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Come to the Table')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader('Session Format'),
            _SectionBody(
              'Come to the Table follows a structured liturgical arc: '
              'Opening, Scripture Reading, Communal Examination, and Closing. '
              'The practice is designed for groups of 4–12 and typically '
              'runs 60–90 minutes.',
            ),
            SizedBox(height: 24),
            _SectionHeader('Opening'),
            _LiturgyStep(
              step: '1',
              instruction:
                  'Gather the group. Light a candle or take a moment of '
                  'silence to mark the beginning of intentional time together.',
            ),
            _LiturgyStep(
              step: '2',
              instruction:
                  'Read aloud together: "We come to examine what is true, '
                  'to name what is broken, and to recommit to the covenant '
                  'that holds us."',
            ),
            SizedBox(height: 24),
            _SectionHeader('Scripture Reading'),
            _LiturgyStep(
              step: '3',
              instruction:
                  'Choose a text from the Berean Tool or the group\'s '
                  'current study arc. Read it once silently, then once aloud.',
            ),
            _LiturgyStep(
              step: '4',
              instruction:
                  'Observe: What does the text actually say? Resist '
                  'interpretation at this stage. Name only what is present.',
            ),
            SizedBox(height: 24),
            _SectionHeader('Communal Examination'),
            _LiturgyStep(
              step: '5',
              instruction:
                  'Each person answers: "What pattern in my life does '
                  'this text expose?" Share without defence or explanation.',
            ),
            _LiturgyStep(
              step: '6',
              instruction:
                  'The group listens. No advice, no comfort, no problem-solving. '
                  'Only presence.',
            ),
            SizedBox(height: 24),
            _SectionHeader('Closing'),
            _LiturgyStep(
              step: '7',
              instruction:
                  'Each person names one concrete action or reorientation '
                  'before the next gathering.',
            ),
            _LiturgyStep(
              step: '8',
              instruction:
                  'Close together: "We leave to live what we have examined. '
                  'We return to examine how we have lived."',
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SectionBody extends StatelessWidget {
  const _SectionBody(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}

class _LiturgyStep extends StatelessWidget {
  const _LiturgyStep({required this.step, required this.instruction});

  final String step;
  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '$step.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              instruction,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
