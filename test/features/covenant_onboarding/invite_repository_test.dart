import 'package:covenant_os/features/covenant_onboarding/data/repositories/invite_repository.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Unit tests for InviteRedemptionResult.
//
// Full repository tests (with a mock SupabaseClient) require a Supabase
// test setup that is deferred to the next slice. This file tests the
// domain-level model and contract constants.
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
}
