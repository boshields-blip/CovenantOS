import 'package:flutter/material.dart';

import 'routes/covenant_routes.dart';

/// Root widget for CovenantOS.
///
/// Builds a [MaterialApp.router] wired to [buildCovenantRouter], which handles
/// entitlement guards, invite acceptance, and all formation feature routes.
class CovenantOsApp extends StatefulWidget {
  const CovenantOsApp({super.key});

  @override
  State<CovenantOsApp> createState() => _CovenantOsAppState();
}

class _CovenantOsAppState extends State<CovenantOsApp> {
  late final _router = buildCovenantRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CovenantOS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
