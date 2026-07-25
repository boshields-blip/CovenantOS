import 'package:covenant_os/features/language_module/presentation/screens/glossary_list_screen.dart';
import 'package:covenant_os/features/language_module/presentation/screens/language_module_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: child);

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

    testWidgets('renders the three principle labels', (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.text('Ground'), findsOneWidget);
      expect(find.text('Examine'), findsOneWidget);
      expect(find.text('Form'), findsOneWidget);
    });

    testWidgets('renders Browse Glossary button', (tester) async {
      await tester.pumpWidget(_wrap(const LanguageModuleHomeScreen()));
      expect(find.text('Browse Glossary'), findsOneWidget);
    });
  });

  group('GlossaryListScreen', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const GlossaryListScreen()));
      expect(find.text('Glossary'), findsOneWidget);
    });

    testWidgets('shows search field', (tester) async {
      await tester.pumpWidget(_wrap(const GlossaryListScreen()));
      expect(
        find.byWidgetPredicate(
          (w) => w is TextField,
        ),
        findsOneWidget,
      );
    });

    testWidgets('lists glossary terms', (tester) async {
      await tester.pumpWidget(_wrap(const GlossaryListScreen()));
      await tester.pumpAndSettle();
      // At least one term should be visible in the list
      expect(find.text('Build the brand'), findsOneWidget);
    });

    testWidgets('filters terms by query', (tester) async {
      await tester.pumpWidget(_wrap(const GlossaryListScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'thought leaders');
      await tester.pumpAndSettle();

      expect(find.text('We need thought leaders'), findsOneWidget);
      // Non-matching term should not appear
      expect(find.text('Build the brand'), findsNothing);
    });

    testWidgets('shows no matching terms message when query has no results',
        (tester) async {
      await tester.pumpWidget(_wrap(const GlossaryListScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'zzz_no_match_zzz');
      await tester.pumpAndSettle();

      expect(find.text('No matching terms.'), findsOneWidget);
    });
  });
}
