import 'package:flutter/material.dart';

/// Entry screen for the Language Module — covenantal vocabulary and formation
/// language.
///
/// The Language Module builds a shared vocabulary grounded in the Foundational
/// Layer (L1) and informed by the Diagnostic Engine (L2) and Berean Tool (L3).
/// It does not reference the Formation Layer (L5).
///
/// Full glossary management (term CRUD, usage notes, cross-references) is
/// planned for a subsequent slice. This screen provides the Slice A navigation
/// entry point and a concise orientation to the module's purpose.
///
/// TODO(next-slice): Add GlossaryTerm model, LanguageRepository, and term
/// browsing/search screens. Tracking: CovenantOS Slice B.
class LanguageModuleHomeScreen extends StatelessWidget {
  const LanguageModuleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Module')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Covenantal Vocabulary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The Language Module builds a shared vocabulary for formation. '
              'Language is not neutral — the words a community uses to describe '
              'reality shape how it understands and practices covenant.',
            ),
            SizedBox(height: 24),
            _LanguagePrinciple(
              label: 'Ground',
              description:
                  'Every term is grounded in the Foundational Layer '
                  'before it is elaborated here.',
            ),
            _LanguagePrinciple(
              label: 'Examine',
              description:
                  'Terms are tested against the Berean Tool — does the '
                  'word match what the primary sources actually say?',
            ),
            _LanguagePrinciple(
              label: 'Form',
              description:
                  'Language that reinforces healthy formation is named '
                  'and modelled. Language that undermines it is identified.',
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                'Glossary and term management coming in next slice.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguagePrinciple extends StatelessWidget {
  const _LanguagePrinciple({
    super.key,
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
