import 'package:covenant_os/features/covenant_forum/presentation/screens/covenant_forum_home_screen.dart';
import 'package:covenant_os/features/language_module/presentation/screens/language_module_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Widget tests for LanguageModuleHomeScreen and CovenantForumHomeScreen.
//
// These are Slice A stub screens; tests verify that the navigation entry
// points render without error and display their orientating content.
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

    testWidgets('renders next-slice notice', (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.textContaining('coming in next slice'), findsOneWidget);
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

    testWidgets('renders next-slice notice', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.textContaining('coming in next slice'), findsOneWidget);
    });
  });
}
