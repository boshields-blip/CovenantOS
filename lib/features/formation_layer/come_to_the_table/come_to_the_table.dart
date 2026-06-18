/// Come to the Table — weekly household formation practice (Layer 5).
///
/// Come to the Table is a weekly household table practice within the Formation
/// Layer. Families and households gather around a shared meal with structured
/// liturgies, reading, and covenantal conversation. The practice draws on the
/// Berean Tool for text engagement and the Language Module for covenantal
/// vocabulary formation.
///
/// Content definition: `covenant_os/05_formation_layer/come_to_the_table/`.
/// Dart implementation source: migrated from
/// `boshields-blip/PlumbLineOS/lib/features/covenant_os/come_to_the_table/`.
library;

import 'package:flutter/material.dart';

/// Entry-point widget for the Come to the Table formation practice.
///
/// Provides session guides, liturgies, and host/guest content for the weekly
/// household table practice. Navigate to this widget to begin a Come to the
/// Table session.
class ComeToTheTablePage extends StatelessWidget {
  /// Creates a [ComeToTheTablePage].
  const ComeToTheTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Come to the Table'),
      ),
      body: const Center(
        child: Text(
          'Come to the Table\nWeekly Household Practice',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
