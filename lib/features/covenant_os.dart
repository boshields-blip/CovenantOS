/// CovenantOS feature barrel — exports the top-level feature entry points.
///
/// Import this file to access any top-level CovenantOS feature widget. Lower
/// layers are also accessible through their own feature libraries.
///
/// Layer ordering (lowest to highest):
/// - Layer 1: Foundational Layer (first principles — content only, no widget)
/// - Layer 2: Diagnostic Engine (belief mapping — content-driven)
/// - Layer 3: Berean Tool — scripture and text examination
/// - Layer 4: Language Module — covenantal vocabulary
/// - Layer 5: Formation Layer / Come to the Table — embodied practices
library;

export 'package:covenant_os/features/berean_tool/berean_tool.dart';
export 'package:covenant_os/features/formation_layer/come_to_the_table/come_to_the_table.dart';
export 'package:covenant_os/features/formation_layer/formation_layer.dart';
export 'package:covenant_os/features/language_module/language_module.dart';
