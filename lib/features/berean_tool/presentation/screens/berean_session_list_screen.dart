import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/berean_repository.dart';
import '../../domain/models/berean_session.dart';

/// Lists the current user's Berean Tool sessions and provides a
/// "New Session" entry point to `BereanSessionFormScreen`.
///
/// In offline/demo mode (no Supabase env vars) the list is empty and the
/// "New Session" button is still navigable so the form can be tested.
class BereanSessionListScreen extends StatefulWidget {
  const BereanSessionListScreen({super.key});

  @override
  State<BereanSessionListScreen> createState() =>
      _BereanSessionListScreenState();
}

class _BereanSessionListScreenState extends State<BereanSessionListScreen> {
  final _repository = const BereanRepository();

  List<BereanSession>? _sessions;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final sessions = await _repository.fetchSessions();
      if (mounted) {
        setState(() {
          _sessions = sessions;
          _errorMessage = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'Unable to load sessions.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berean Sessions')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/covenant/berean/sessions/new');
          _load();
        },
        icon: const Icon(Icons.add),
        label: const Text('New Session'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_errorMessage!),
            const SizedBox(height: 8),
            TextButton(onPressed: _load, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_sessions == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_sessions!.isEmpty) {
      return const Center(
        child: Text('No sessions yet. Start your first examination.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 88),
      itemCount: _sessions!.length,
      itemBuilder: (context, index) {
        final session = _sessions![index];
        return _SessionTile(session: session);
      },
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});

  final BereanSession session;

  @override
  Widget build(BuildContext context) {
    final date = session.conductedAt;
    final dateLabel =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.menu_book),
        title: Text(
          session.passage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(dateLabel),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (_) => _SessionDetailSheet(session: session),
          );
        },
      ),
    );
  }
}

class _SessionDetailSheet extends StatelessWidget {
  const _SessionDetailSheet({required this.session});

  final BereanSession session;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session.passage,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (session.observations != null) ...[
                _OIASection(label: 'Observe', body: session.observations!),
                const SizedBox(height: 16),
              ],
              if (session.interpretation != null) ...[
                _OIASection(label: 'Interpret', body: session.interpretation!),
                const SizedBox(height: 16),
              ],
              if (session.application != null) ...[
                _OIASection(label: 'Apply', body: session.application!),
                const SizedBox(height: 16),
              ],
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}

class _OIASection extends StatelessWidget {
  const _OIASection({required this.label, required this.body});

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(body, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
