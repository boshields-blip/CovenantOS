import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/formation_repository.dart';
import '../../domain/models/formation_group.dart';

/// Entry screen for the Formation Layer — lists the user's formation groups
/// and provides navigation to the two core practices.
class FormationHomeScreen extends StatefulWidget {
  const FormationHomeScreen({super.key});

  @override
  State<FormationHomeScreen> createState() => _FormationHomeScreenState();
}

class _FormationHomeScreenState extends State<FormationHomeScreen> {
  final _repository = const FormationRepository();

  List<FormationGroup>? _groups;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    try {
      final groups = await _repository.fetchGroups();
      if (mounted) {
        setState(() {
          _groups = groups;
          _errorMessage = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Unable to load formation groups.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PracticeCard(
              title: 'Come to the Table',
              subtitle:
                  'A liturgical and relational practice for community gathering.',
              onTap: () => context.go('/covenant/formation/come-to-the-table'),
            ),
            const SizedBox(height: 12),
            _PracticeCard(
              title: 'Harvest and Hymn',
              subtitle:
                  'A seasonal practice connecting creation rhythms with formation.',
              onTap: () => context.go('/covenant/formation/harvest-and-hymn'),
            ),
            const SizedBox(height: 24),
            Text(
              'My Formation Groups',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _GroupList(
                groups: _groups,
                errorMessage: _errorMessage,
                onRefresh: _loadGroups,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  const _PracticeCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _GroupList extends StatelessWidget {
  const _GroupList({
    required this.groups,
    required this.errorMessage,
    required this.onRefresh,
  });

  final List<FormationGroup>? groups;
  final String? errorMessage;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(errorMessage!),
            const SizedBox(height: 8),
            TextButton(onPressed: onRefresh, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (groups == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (groups!.isEmpty) {
      return const Center(
        child: Text('No formation groups yet.'),
      );
    }

    return ListView.builder(
      itemCount: groups!.length,
      itemBuilder: (context, index) {
        final group = groups![index];
        return ListTile(
          title: Text(group.name),
          subtitle:
              group.description != null ? Text(group.description!) : null,
        );
      },
    );
  }
}
