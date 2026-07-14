import 'package:covenant_os/features/covenant_onboarding/presentation/screens/accept_invite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Widget tests for AcceptInviteScreen.
//
// All tests run without a live Supabase connection. AppConfig.isConfigured
// is false in the test environment, which exercises the backend-pending guard.
// ---------------------------------------------------------------------------

Widget _wrap(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  group('AcceptInviteScreen — empty token guard', () {
    testWidgets('shows no-token message when token is empty', (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: '')),
      );
      expect(find.text('No invitation token found.'), findsOneWidget);
    });

    testWidgets('does not show Accept button when token is empty',
        (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: '')),
      );
      // The ElevatedButton "Accept Invitation" must not appear in the body.
      expect(
        find.widgetWithText(ElevatedButton, 'Accept Invitation'),
        findsNothing,
      );
    });

    testWidgets('shows invite link format hint when token is empty',
        (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: '')),
      );
      expect(find.textContaining('invite link'), findsOneWidget);
    });
  });

  group('AcceptInviteScreen — backend-pending guard', () {
    // In test environment AppConfig.isConfigured = false, and token is
    // non-empty, so the backend-pending branch is exercised.
    testWidgets('shows pending notice when backend is not configured',
        (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: 'test-token-123')),
      );
      expect(find.text('Backend connection pending.'), findsOneWidget);
    });

    testWidgets(
        'does not show Accept button when backend is not configured',
        (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: 'test-token-123')),
      );
      expect(
        find.widgetWithText(ElevatedButton, 'Accept Invitation'),
        findsNothing,
      );
    });

    testWidgets('pending notice mentions retry instruction', (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: 'test-token-123')),
      );
      expect(find.textContaining('try again'), findsOneWidget);
    });
  });

  group('AcceptInviteScreen — app bar title', () {
    testWidgets('shows Accept Invitation app bar for empty token',
        (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: '')),
      );
      expect(find.text('Accept Invitation'), findsOneWidget);
    });

    testWidgets('shows Accept Invitation app bar for non-empty token',
        (tester) async {
      await tester.pumpWidget(
        _wrap(const AcceptInviteScreen(token: 'some-token')),
      );
      expect(find.text('Accept Invitation'), findsOneWidget);
    });
  });
}
