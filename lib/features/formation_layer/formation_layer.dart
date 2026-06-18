/// Formation Layer feature — Layer 5: embodied formation practices.
///
/// The topmost layer of the CovenantOS 5-layer architecture. Provides Flutter
/// UI and guides for the two primary formation practices:
/// - **Come to the Table** — a weekly household table practice
/// - **Harvest and Hymn** — a quarterly seasonal community gathering
///
/// As the highest layer, the Formation Layer may import from any layer below
/// it (Layers 1–4). No other layer may import from this one.
///
/// Content definition: `covenant_os/05_formation_layer/`.
/// Dart implementation source: migrated from
/// `boshields-blip/PlumbLineOS/lib/features/covenant_os/formation/` and
/// `lib/features/covenant_os/come_to_the_table/`.
library;

import 'package:flutter/material.dart';

/// Entry-point widget for the Formation Layer feature.
///
/// Hosts the formation practice screens including Come to the Table and
/// Harvest and Hymn guides. Navigate to this widget to enter the Formation
/// Layer experience.
class FormationLayerPage extends StatelessWidget {
  /// Creates a [FormationLayerPage].
  const FormationLayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formation Layer'),
      ),
      body: const Center(
        child: Text(
          'Formation Layer\nEmbodied Formation Practices',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
