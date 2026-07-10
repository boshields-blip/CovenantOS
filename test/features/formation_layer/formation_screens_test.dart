import 'package:covenant_os/features/formation_layer/presentation/screens/come_to_the_table_screen.dart';
import 'package:covenant_os/features/formation_layer/presentation/screens/harvest_and_hymn_screen.dart';
import 'package:covenant_os/features/berean_tool/presentation/screens/berean_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  group('ComeToTheTableScreen', () {
    testWidgets('renders session format heading', (tester) async {
      await tester.pumpWidget(_wrap(const ComeToTheTableScreen()));
      expect(find.text('Come to the Table'), findsWidgets);
      expect(find.text('Session Format'), findsOneWidget);
    });

    testWidgets('renders opening and closing sections', (tester) async {
      await tester.pumpWidget(_wrap(const ComeToTheTableScreen()));
      await tester.pumpAndSettle();
      expect(find.text('Opening'), findsOneWidget);
      expect(find.text('Closing'), findsOneWidget);
    });
  });

  group('HarvestAndHymnScreen', () {
    testWidgets('renders four season cards', (tester) async {
      await tester.pumpWidget(_wrap(const HarvestAndHymnScreen()));
      await tester.pumpAndSettle();
      expect(find.text('Spring'), findsOneWidget);
      expect(find.text('Summer'), findsOneWidget);
      expect(find.text('Autumn'), findsOneWidget);
      expect(find.text('Winter'), findsOneWidget);
    });
  });

  group('BereanHomeScreen', () {
    testWidgets('renders three method steps', (tester) async {
      await tester.pumpWidget(_wrap(const BereanHomeScreen()));
      expect(find.text('Observe'), findsOneWidget);
      expect(find.text('Interpret'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
    });
  });
}
