import 'package:covenant_os/features/covenant_onboarding/data/repositories/invite_repository.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Unit tests for InviteRepository and InviteRedemptionResult.
//
// Full repository tests (with a mock SupabaseClient) require a Supabase
// test setup that is deferred to the next slice. This file tests the
// domain-level model, the offline/unconfigured guard, and contract constants.
// ---------------------------------------------------------------------------

void main() {
  group('InviteRedemptionResult', () {
    test('success result has no error message', () {
      const result = InviteRedemptionResult(success: true);
      expect(result.success, isTrue);
      expect(result.errorMessage, isNull);
    });

    test('failure result carries an error message', () {
      const result = InviteRedemptionResult(
        success: false,
        errorMessage: 'Token expired.',
      );
      expect(result.success, isFalse);
      expect(result.errorMessage, 'Token expired.');
    });
  });

  group('InviteRepository — offline/unconfigured guard', () {
    // In the test environment AppConfig.isConfigured is false (no --dart-define
    // vars), so redeemInvite must return a safe failure without attempting any
    // network call.
    test('redeemInvite returns failure when backend is not configured', () async {
      const repo = InviteRepository();
      final result = await repo.redeemInvite('any-token');
      expect(result.success, isFalse);
      expect(result.errorMessage, isNotNull);
      expect(
        result.errorMessage,
        contains('Backend not configured'),
      );
    });

    test('redeemInvite returns failure for empty token when not configured',
        () async {
      const repo = InviteRepository();
      final result = await repo.redeemInvite('');
      expect(result.success, isFalse);
      expect(result.errorMessage, isNotNull);
    });

    test('refreshSession completes without throwing when not configured',
        () async {
      const repo = InviteRepository();
      // Should be a no-op and not throw.
      await expectLater(repo.refreshSession(), completes);
    });
  });
}
