import 'package:covenant_os/app/routes/covenant_routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CovenantRoutePaths', () {
    test('path constants have expected values', () {
      expect(CovenantRoutePaths.covenant, '/covenant');
      expect(CovenantRoutePaths.acceptInvite, '/covenant/accept-invite');
      expect(CovenantRoutePaths.onboarding, '/covenant/onboarding');
      expect(CovenantRoutePaths.formation, '/covenant/formation');
      expect(
        CovenantRoutePaths.comeToTheTable,
        '/covenant/formation/come-to-the-table',
      );
      expect(
        CovenantRoutePaths.harvestAndHymn,
        '/covenant/formation/harvest-and-hymn',
      );
      expect(CovenantRoutePaths.berean, '/covenant/berean');
      expect(CovenantRoutePaths.language, '/covenant/language');
      expect(CovenantRoutePaths.forum, '/covenant/forum');
    });

    test('all Slice A paths are under /covenant prefix', () {
      final paths = [
        CovenantRoutePaths.covenant,
        CovenantRoutePaths.acceptInvite,
        CovenantRoutePaths.onboarding,
        CovenantRoutePaths.formation,
        CovenantRoutePaths.comeToTheTable,
        CovenantRoutePaths.harvestAndHymn,
        CovenantRoutePaths.berean,
        CovenantRoutePaths.language,
        CovenantRoutePaths.forum,
      ];
      for (final path in paths) {
        expect(
          path.startsWith('/covenant') || path == CovenantRoutePaths.root,
          isTrue,
          reason: '$path should be under /covenant',
        );
      }
    });

    test('accept-invite path supports token query parameter by convention', () {
      // The path itself carries no token; the token arrives as a query param.
      // Verify the path does not accidentally encode a token placeholder.
      expect(CovenantRoutePaths.acceptInvite.contains('token'), isFalse);
    });
  });

  group('resolveCovenantRedirect', () {
    test('allows all routes when the app is not configured', () {
      expect(
        resolveCovenantRedirect(
          isConfigured: false,
          hasSession: false,
          hasCovenantEntitlement: false,
        ),
        isNull,
      );
    });

    test('redirects protected routes to accept-invite without a session', () {
      expect(
        resolveCovenantRedirect(
          isConfigured: true,
          hasSession: false,
          hasCovenantEntitlement: false,
        ),
        CovenantRoutePaths.acceptInvite,
      );
    });

    test('redirects protected routes to accept-invite without entitlement', () {
      expect(
        resolveCovenantRedirect(
          isConfigured: true,
          hasSession: true,
          hasCovenantEntitlement: false,
        ),
        CovenantRoutePaths.acceptInvite,
      );
    });

    test('allows protected routes with session and entitlement', () {
      expect(
        resolveCovenantRedirect(
          isConfigured: true,
          hasSession: true,
          hasCovenantEntitlement: true,
        ),
        isNull,
      );
    });
  });
}
