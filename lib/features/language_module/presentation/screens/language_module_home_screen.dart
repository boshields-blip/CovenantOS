import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Entry screen for the Language Module — covenantal vocabulary and formation
/// language.
///
/// The Language Module builds a shared vocabulary grounded in the Foundational
/// Layer (L1) and informed by the Diagnostic Engine (L2) and Berean Tool (L3).
/// It does not reference the Formation Layer (L5).
///
/// The glossary is sourced from the content tree at
/// [covenant_os/04_language_module/worldly_vs_covenantal_dictionary.md] and
/// is browsable in [GlossaryListScreen].
class LanguageModuleHomeScreen extends StatelessWidget {
  const LanguageModuleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Module')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Covenantal Vocabulary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'The Language Module builds a shared vocabulary for formation. '
              'Language is not neutral — the words a community uses to describe '
              'reality shape how it understands and practices covenant.',
            ),
            const SizedBox(height: 24),
            const _LanguagePrinciple(
              label: 'Ground',
              description:
                  'Every term is grounded in the Foundational Layer '
                  'before it is elaborated here.',
            ),
            const _LanguagePrinciple(
              label: 'Examine',
              description:
                  'Terms are tested against the Berean Tool — does the '
                  'word match what the primary sources actually say?',
            ),
            const _LanguagePrinciple(
              label: 'Form',
              description:
                  'Language that reinforces healthy formation is named '
                  'and modelled. Language that undermines it is identified.',
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.push('/covenant/language/glossary'),
              icon: const Icon(Icons.book),
              label: const Text('Browse Glossary'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguagePrinciple extends StatelessWidget {
  const _LanguagePrinciple({
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
