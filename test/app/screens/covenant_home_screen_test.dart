import 'package:covenant_os/app/screens/covenant_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Widget tests for CovenantHomeScreen.
//
// These tests verify that all Slice A navigation cards are present and
// that all tappable cards have navigation targets (no dead-end onTap: null).
// ---------------------------------------------------------------------------

// CovenantHomeScreen uses context.go() from go_router, which requires a
// router context. We wrap with MaterialApp and intercept navigation by
// checking that the cards are rendered correctly. Full navigation integration
// tests would require a GoRouter wrapper; those are deferred to a subsequent
// test slice.
Widget _wrap(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  group('CovenantHomeScreen — navigation cards', () {
    testWidgets('renders Formation Layer card', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('Formation Layer'), findsOneWidget);
    });

    testWidgets('renders Berean Tool card', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('Berean Tool'), findsOneWidget);
    });

    testWidgets('renders Language Module card', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('Language Module'), findsOneWidget);
    });

    testWidgets('renders Covenant Forum card', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('Covenant Forum'), findsOneWidget);
    });

    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('CovenantOS'), findsOneWidget);
    });

    testWidgets('all four feature cards have chevron trailing icon',
        (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      // All cards now have onTap set, so all should show chevron_right.
      expect(find.byIcon(Icons.chevron_right), findsNWidgets(4));
    });
  });

  group('CovenantHomeScreen — section labels', () {
    testWidgets('renders Formation section label', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('Formation'), findsOneWidget);
    });

    testWidgets('renders Language & Community section label', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantHomeScreen()));
      expect(find.text('Language & Community'), findsOneWidget);
    });
  });
}
