import 'package:covenant_os/features/covenant_forum/presentation/screens/covenant_forum_home_screen.dart';
import 'package:covenant_os/features/covenant_forum/presentation/screens/forum_post_form_screen.dart';
import 'package:covenant_os/features/covenant_forum/presentation/screens/forum_post_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: child);

void main() {
  group('CovenantForumHomeScreen', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Covenant Forum'), findsOneWidget);
    });

    testWidgets('renders Community Formation Dialogue heading', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Community Formation Dialogue'), findsOneWidget);
    });

    testWidgets('renders forum principle labels', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Formation-first'), findsOneWidget);
      expect(find.text('Group-scoped'), findsOneWidget);
      expect(find.text('Covenant-held'), findsOneWidget);
    });

    testWidgets('renders Enter Forum button', (tester) async {
      await tester.pumpWidget(_wrap(const CovenantForumHomeScreen()));
      expect(find.text('Enter Forum'), findsOneWidget);
    });
  });

  group('ForumPostListScreen — offline mode', () {
    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostListScreen()));
      await tester.pumpAndSettle();
      expect(find.text('Covenant Forum'), findsOneWidget);
    });

    testWidgets('shows empty state message in offline mode', (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostListScreen()));
      await tester.pumpAndSettle();
      expect(find.textContaining('No posts yet'), findsOneWidget);
    });

    testWidgets('shows New Post FAB', (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostListScreen()));
      await tester.pumpAndSettle();
      expect(find.text('New Post'), findsOneWidget);
    });
  });

  group('ForumPostFormScreen', () {
    testWidgets('renders form app bar title', (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostFormScreen()));
      expect(find.text('New Post'), findsOneWidget);
    });

    testWidgets('renders type selector', (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostFormScreen()));
      expect(find.text('Reflection'), findsOneWidget);
      expect(find.text('Question'), findsOneWidget);
      expect(find.text('Discussion'), findsOneWidget);
    });

    testWidgets('renders required input fields', (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostFormScreen()));
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
    });

    testWidgets('shows title validation error when submitting empty form',
        (tester) async {
      await tester.pumpWidget(_wrap(const ForumPostFormScreen()));
      await tester.pumpAndSettle();

      final publishButton = find.widgetWithText(FilledButton, 'Publish Post');
      await tester.ensureVisible(publishButton);
      await tester.tap(publishButton);
      await tester.pumpAndSettle();

      expect(find.text('Title is required.'), findsOneWidget);
    });
  });
}
