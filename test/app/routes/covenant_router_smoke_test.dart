import 'package:covenant_os/app/routes/covenant_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _wrapRouter(GoRouter router) {
  return MaterialApp.router(routerConfig: router);
}

void main() {
  group('Covenant router smoke tests', () {
    testWidgets('root entry redirects to CovenantOS home in demo mode',
        (tester) async {
      final router = buildCovenantRouter(
        initialLocation: CovenantRoutePaths.root,
      );

      await tester.pumpWidget(_wrapRouter(router));
      await tester.pumpAndSettle();

      expect(find.text('CovenantOS'), findsWidgets);
      expect(
        router.routeInformationProvider.value.uri.path,
        CovenantRoutePaths.covenant,
      );
    });

    testWidgets('accept-invite deep link preserves token and stays public',
        (tester) async {
      final router = buildCovenantRouter(
        initialLocation: '${CovenantRoutePaths.acceptInvite}?token=test-token',
        isConfiguredOverride: true,
        hasSessionOverride: false,
      );

      await tester.pumpWidget(_wrapRouter(router));
      await tester.pumpAndSettle();

      expect(find.text('Backend connection pending.'), findsOneWidget);
      expect(
        router.routeInformationProvider.value.uri.path,
        CovenantRoutePaths.acceptInvite,
      );
      expect(
        router.routeInformationProvider.value.uri.queryParameters['token'],
        'test-token',
      );
    });

    testWidgets('protected formation deep link redirects unauthenticated users',
        (tester) async {
      final router = buildCovenantRouter(
        initialLocation: CovenantRoutePaths.comeToTheTable,
        isConfiguredOverride: true,
        hasSessionOverride: false,
      );

      await tester.pumpWidget(_wrapRouter(router));
      await tester.pumpAndSettle();

      expect(find.text('No invitation token found.'), findsOneWidget);
      expect(
        router.routeInformationProvider.value.uri.path,
        CovenantRoutePaths.acceptInvite,
      );
    });

    testWidgets('protected onboarding deep link redirects users without entitlement',
        (tester) async {
      final router = buildCovenantRouter(
        initialLocation: CovenantRoutePaths.onboarding,
        isConfiguredOverride: true,
        hasSessionOverride: true,
        hasCovenantEntitlementOverride: false,
      );

      await tester.pumpWidget(_wrapRouter(router));
      await tester.pumpAndSettle();

      expect(find.text('No invitation token found.'), findsOneWidget);
      expect(
        router.routeInformationProvider.value.uri.path,
        CovenantRoutePaths.acceptInvite,
      );
    });

    testWidgets('protected onboarding deep link resolves for entitled users',
        (tester) async {
      final router = buildCovenantRouter(
        initialLocation: CovenantRoutePaths.onboarding,
        isConfiguredOverride: true,
        hasSessionOverride: true,
        hasCovenantEntitlementOverride: true,
      );

      await tester.pumpWidget(_wrapRouter(router));
      await tester.pumpAndSettle();

      expect(find.text('Welcome to CovenantOS'), findsOneWidget);
      expect(
        router.routeInformationProvider.value.uri.path,
        CovenantRoutePaths.onboarding,
      );
    });
  });
}
