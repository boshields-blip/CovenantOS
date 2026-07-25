/// Layer dependency governance check for CovenantOS.
///
/// Enforces the 5-layer rule: lower-numbered layers must not import from
/// higher-numbered layers. The numbered layers in Flutter code are:
///
///   Layer 3 — berean_tool       (L3) — may reference L1–L2 content; must not
///                                       import language_module (L4) or
///                                       formation_layer (L5)
///   Layer 4 — language_module   (L4) — may reference L1–L3; must not import
///                                       formation_layer (L5)
///   Layer 5 — formation_layer   (L5) — may reference all lower layers
///
/// Cross-cutting surfaces (covenant_onboarding, covenant_forum) are not
/// numbered layers and are not checked here. They must not create upward
/// dependencies either, but their role is to integrate across the stack.
///
/// Run from the repository root:
///   dart tool/check_layer_deps.dart
///
/// Exits with code 1 if violations are found, 0 if the check passes.
library check_layer_deps;

import 'dart:io';

void main() {
  final violations = <String>[];

  // L3 must not import L4 or L5
  _check(
    sourceLayer: 'berean_tool',
    forbiddenLayers: ['language_module', 'formation_layer'],
    violations: violations,
  );

  // L4 must not import L5
  _check(
    sourceLayer: 'language_module',
    forbiddenLayers: ['formation_layer'],
    violations: violations,
  );

  if (violations.isEmpty) {
    stdout.writeln('✓ Layer dependency check passed — no upward references found.');
    exit(0);
  }

  stderr.writeln('\n❌ LAYER DEPENDENCY VIOLATIONS:\n');
  for (final v in violations) {
    stderr.writeln('  $v');
  }
  stderr.writeln(
    '\nLower-numbered layers must not import from higher-numbered layers.\n'
    'See docs/ARCHITECTURE.md for the full 5-layer dependency rules.',
  );
  exit(1);
}

void _check({
  required String sourceLayer,
  required List<String> forbiddenLayers,
  required List<String> violations,
}) {
  final dir = Directory('lib/features/$sourceLayer');
  if (!dir.existsSync()) return;

  for (final entity in dir.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;

    final lines = entity.readAsLinesSync();
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (!line.trimLeft().startsWith('import')) continue;

      for (final forbidden in forbiddenLayers) {
        if (line.contains('features/$forbidden/')) {
          violations.add(
            '${entity.path}:${i + 1} — '
            '$sourceLayer (L${_layerNumber(sourceLayer)}) imports '
            '$forbidden (L${_layerNumber(forbidden)})',
          );
        }
      }
    }
  }
}

int _layerNumber(String layer) {
  switch (layer) {
    case 'berean_tool':
      return 3;
    case 'language_module':
      return 4;
    case 'formation_layer':
      return 5;
    default:
      return 0;
  }
}
