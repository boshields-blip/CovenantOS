import 'package:covenant_os/features/covenant_forum/presentation/screens/covenant_forum_home_screen.dart';
import 'package:covenant_os/features/language_module/presentation/screens/language_module_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Widget tests for LanguageModuleHomeScreen and CovenantForumHomeScreen.
//
// Both screens now have full navigation entry points rather than stubs.
// These tests verify that the orientation content and navigation buttons
// render correctly.
// ---------------------------------------------------------------------------

Widget _wrap(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  group('LanguageModuleHomeScreen', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.text('Language Module'), findsOneWidget);
    });

    testWidgets('renders Covenantal Vocabulary heading', (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.text('Covenantal Vocabulary'), findsOneWidget);
    });

    testWidgets('renders the three method labels', (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.text('Ground'), findsOneWidget);
      expect(find.text('Examine'), findsOneWidget);
      expect(find.text('Form'), findsOneWidget);
    });

    testWidgets('renders Browse Glossary button instead of stub notice',
        (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.text('Browse Glossary'), findsOneWidget);
    });
  });

  group('CovenantForumHomeScreen', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Covenant Forum'), findsOneWidget);
    });

    testWidgets('renders Community Formation Dialogue heading', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Community Formation Dialogue'), findsOneWidget);
    });

    testWidgets('renders the three principle labels', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Formation-first'), findsOneWidget);
      expect(find.text('Group-scoped'), findsOneWidget);
      expect(find.text('Covenant-held'), findsOneWidget);
    });

    testWidgets('renders Enter Forum button instead of stub notice',
        (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Enter Forum'), findsOneWidget);
    });
  });
}
