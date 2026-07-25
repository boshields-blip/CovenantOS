import 'package:flutter/material.dart';

import '../../data/glossary_data.dart';
import '../../domain/models/glossary_term.dart';

/// Browsable list of all covenantal glossary terms.
///
/// Entries are sourced from [glossaryTerms], which mirrors the content tree at
/// [covenant_os/04_language_module/worldly_vs_covenantal_dictionary.md].
/// A search bar filters entries by worldly phrase, root, or alternative.
class GlossaryListScreen extends StatefulWidget {
  const GlossaryListScreen({super.key});

  @override
  State<GlossaryListScreen> createState() => _GlossaryListScreenState();
}

class _GlossaryListScreenState extends State<GlossaryListScreen> {
  String _query = '';

  List<GlossaryTerm> get _filtered {
    if (_query.isEmpty) return glossaryTerms;
    final q = _query.toLowerCase();
    return glossaryTerms.where((t) {
      return t.worldlyPhrase.toLowerCase().contains(q) ||
          t.philosophicalRoot.toLowerCase().contains(q) ||
          t.covenantAlternative.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final terms = _filtered;
    return Scaffold(
      appBar: AppBar(title: const Text('Glossary')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search phrases, roots, or alternatives…',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: terms.isEmpty
                ? const Center(child: Text('No matching terms.'))
                : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 24),
                    itemCount: terms.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return _GlossaryTile(term: terms[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _GlossaryTile extends StatelessWidget {
  const _GlossaryTile({required this.term});

  final GlossaryTerm term;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showDetail(context),
      title: Text(
        term.worldlyPhrase,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        term.philosophicalRoot,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  void _showDetail(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => _GlossaryDetailSheet(term: term),
    );
  }
}

class _GlossaryDetailSheet extends StatelessWidget {
  const _GlossaryDetailSheet({required this.term});

  final GlossaryTerm term;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            term.worldlyPhrase,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Root: ${term.philosophicalRoot}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            'Covenantal alternative',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            term.covenantAlternative,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
