import 'package:covenant_os/features/berean_tool/presentation/screens/berean_home_screen.dart';
import 'package:covenant_os/features/berean_tool/presentation/screens/berean_session_form_screen.dart';
import 'package:covenant_os/features/berean_tool/presentation/screens/berean_session_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: child);

void main() {
  group('BereanHomeScreen', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const BereanHomeScreen()));
      expect(find.text('Berean Tool'), findsOneWidget);
    });

    testWidgets('renders OIA method steps', (tester) async {
      await tester.pumpWidget(_wrap(const BereanHomeScreen()));
      expect(find.text('Observe'), findsOneWidget);
      expect(find.text('Interpret'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
    });

    testWidgets('renders session navigation buttons', (tester) async {
      await tester.pumpWidget(_wrap(const BereanHomeScreen()));
      expect(find.text('Start New Session'), findsOneWidget);
      expect(find.text('View My Sessions'), findsOneWidget);
    });
  });

  group('BereanSessionListScreen — offline mode', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const BereanSessionListScreen()));
      await tester.pumpAndSettle();
      expect(find.text('Berean Sessions'), findsOneWidget);
    });

    testWidgets('shows empty state in offline mode', (tester) async {
      await tester.pumpWidget(_wrap(const BereanSessionListScreen()));
      await tester.pumpAndSettle();
      expect(
        find.textContaining('No sessions yet'),
        findsOneWidget,
      );
    });

    testWidgets('shows New Session FAB', (tester) async {
      await tester.pumpWidget(_wrap(const BereanSessionListScreen()));
      await tester.pumpAndSettle();
      expect(find.text('New Session'), findsOneWidget);
    });
  });

  group('BereanSessionFormScreen', () {
    testWidgets('renders form title', (tester) async {
      await tester.pumpWidget(_wrap(const BereanSessionFormScreen()));
      expect(find.text('New Examination Session'), findsOneWidget);
    });

    testWidgets('renders all three OIA field labels', (tester) async {
      await tester.pumpWidget(_wrap(const BereanSessionFormScreen()));
      await tester.pumpAndSettle();
      expect(find.text('Passage'), findsOneWidget);
      expect(find.text('Observe'), findsOneWidget);
      expect(find.text('Interpret'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
    });

    testWidgets('shows validation error when passage is empty on submit',
        (tester) async {
      await tester.pumpWidget(_wrap(const BereanSessionFormScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save Session'));
      await tester.pumpAndSettle();

      expect(find.text('Passage is required.'), findsOneWidget);
    });
  });
}
