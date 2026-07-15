import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// CovenantOS home screen — the top-level entry point for authenticated users
/// with the `os.covenant` entitlement.
///
/// Surfaces navigation tiles for each active feature in Slice A:
/// Formation Layer, Berean Tool (stub), Language Module (stub),
/// and Covenant Forum (stub).
class CovenantHomeScreen extends StatelessWidget {
  const CovenantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CovenantOS')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formation',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            _NavCard(
              title: 'Formation Layer',
              subtitle: 'Come to the Table · Harvest and Hymn',
              icon: Icons.groups,
              onTap: () => context.go('/covenant/formation'),
            ),
            const SizedBox(height: 8),
            _NavCard(
              title: 'Berean Tool',
              subtitle: 'Scripture and text examination',
              icon: Icons.menu_book,
              onTap: () => context.go('/covenant/berean'),
            ),
            const SizedBox(height: 24),
            Text(
              'Coming soon',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            _NavCard(
              title: 'Language Module',
              subtitle: 'Covenantal vocabulary and formation language',
              icon: Icons.translate,
              onTap: () => context.go('/covenant/language'),
            ),
            const SizedBox(height: 8),
            _NavCard(
              title: 'Covenant Forum',
              subtitle: 'Community discussion and formation dialogue',
              icon: Icons.forum,
              onTap: () => context.go('/covenant/forum'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  const _NavCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return Card(
      child: ListTile(
        enabled: enabled,
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: enabled ? const Icon(Icons.chevron_right) : null,
        onTap: onTap,
      ),
    );
  }
}
