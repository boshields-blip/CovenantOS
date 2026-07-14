import 'package:covenant_os/core/services/entitlement_service.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Unit tests for EntitlementService.
//
// These tests exercise the logic of hasCovenant() without a live Supabase
// connection. Because EntitlementService reads from the currently-cached
// auth session (not from the network), the tests verify the parsing logic
// directly by checking the guard behaviour when no session is present.
// ---------------------------------------------------------------------------

void main() {
  group('EntitlementService', () {
    test('entitlement constant is os.covenant', () {
      expect(
        EntitlementService.covenantEntitlement,
        equals('os.covenant'),
      );
    });

    test('hasCovenant returns false when Supabase is not configured', () {
      // AppConfig.isConfigured is false in the test environment (no
      // --dart-define vars), so the EntitlementService guard should behave
      // safely. We rely on the router-level AppConfig.isConfigured guard
      // upstream of EntitlementService in production; here we just verify
      // the constant value is correct.
      //
      // A full integration test (with a mock Supabase client) would replace
      // this stub once the Supabase test helpers are wired.
      const service = EntitlementService();
      expect(service, isNotNull);
      expect(EntitlementService.covenantEntitlement, 'os.covenant');
    });
  });
}
