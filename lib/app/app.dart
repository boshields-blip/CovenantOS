import 'package:flutter/material.dart';

class CovenantOsApp extends StatelessWidget {
  const CovenantOsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovenantOS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CovenantOS'),
      ),
      body: const Center(
        child: Text(
          'CovenantOS\nPhilosophical Formation Tool',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
