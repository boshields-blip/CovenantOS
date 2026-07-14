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
    });
  });
}
