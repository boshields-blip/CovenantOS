import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Post-invite-acceptance onboarding screen.
///
/// Walks the new CovenantOS member through a brief orientation before
/// sending them to the main formation home. This screen should only be
/// reached after a successful `AcceptInviteScreen` redemption — the router
/// guards this route behind the `os.covenant` entitlement check.
class CovenantOnboardingScreen extends StatelessWidget {
  const CovenantOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to CovenantOS')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'CovenantOS is structured around five formation layers — '
              'from first principles through to embodied community practices. '
              'Each layer builds on the ones below it.',
            ),
            const SizedBox(height: 20),
            const _LayerCard(
              number: '1',
              title: 'Foundational Layer',
              description: 'First principles and the governing frame.',
            ),
            const _LayerCard(
              number: '2',
              title: 'Diagnostic Engine',
              description: 'Surface beliefs, contradictions, and patterns.',
            ),
            const _LayerCard(
              number: '3',
              title: 'Berean Tool',
              description: 'Scripture and text examination.',
            ),
            const _LayerCard(
              number: '4',
              title: 'Language Module',
              description: 'Covenantal vocabulary and formation language.',
            ),
            const _LayerCard(
              number: '5',
              title: 'Formation Layer',
              description:
                  'Embodied practices: Come to the Table, Harvest and Hymn.',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/covenant'),
              child: const Text('Begin Formation'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LayerCard extends StatelessWidget {
  const _LayerCard({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            child: Text(number, style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
