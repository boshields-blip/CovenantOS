import 'package:flutter/material.dart';

/// Screen presenting the Harvest and Hymn formation practice.
///
/// Harvest and Hymn is a seasonal practice that connects the rhythms of
/// creation with the rhythms of formation. It is documented in detail in
/// [covenant_os/05_formation_layer/harvest_and_hymn/].
///
/// Each season carries a distinct formation theme:
/// - Spring — planting and intention
/// - Summer — tending and faithfulness
/// - Autumn — harvest, gratitude, and reckoning
/// - Winter — rest, reflection, and dormancy
class HarvestAndHymnScreen extends StatelessWidget {
  const HarvestAndHymnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harvest and Hymn')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader('About this Practice'),
            _SectionBody(
              'Harvest and Hymn is a quarterly gathering practice aligned '
              'to the four seasons. Each gathering moves through three '
              'movements: Reckon (what has been grown or lost this season), '
              'Receive (receive the season\'s formation through hymn and '
              'reflection), and Resolve (name what is planted for the next '
              'season).',
            ),
            SizedBox(height: 24),
            _SeasonCard(
              season: 'Spring',
              icon: Icons.local_florist,
              theme: 'Planting and Intention',
              prompt:
                  'What are you planting in this season? What intention '
                  'do you carry into the growing months?',
            ),
            _SeasonCard(
              season: 'Summer',
              icon: Icons.wb_sunny,
              theme: 'Tending and Faithfulness',
              prompt:
                  'What requires faithful tending right now? Where have '
                  'you been faithful? Where have you let things go dry?',
            ),
            _SeasonCard(
              season: 'Autumn',
              icon: Icons.eco,
              theme: 'Harvest, Gratitude, and Reckoning',
              prompt:
                  'What has matured or been harvested this year? What did '
                  'not bear fruit, and what do you understand about why?',
            ),
            _SeasonCard(
              season: 'Winter',
              icon: Icons.ac_unit,
              theme: 'Rest, Reflection, and Dormancy',
              prompt:
                  'What needs to lie fallow? What has this year revealed '
                  'about the kind of formation you need next?',
            ),
            SizedBox(height: 24),
            _SectionHeader('Gathering Format'),
            _SectionBody(
              'Gatherings follow the Reckon → Receive → Resolve arc. '
              'Allow 2–3 hours. Include a shared meal when possible. '
              'Elect one elder or facilitator to hold the arc and close '
              'with a seasonal hymn or psalm.',
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

class _SeasonCard extends StatelessWidget {
  const _SeasonCard({super.key,
    required this.season,
    required this.icon,
    required this.theme,
    required this.prompt,
  });

  final String season;
  final IconData icon;
  final String theme;
  final String prompt;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  season,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  '— $theme',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(prompt, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
