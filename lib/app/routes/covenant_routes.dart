import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/config/app_config.dart';
import '../../core/services/entitlement_service.dart';
import '../../features/berean_tool/presentation/screens/berean_home_screen.dart';
import '../../features/covenant_forum/presentation/screens/covenant_forum_home_screen.dart';
import '../../features/covenant_onboarding/presentation/screens/accept_invite_screen.dart';
import '../../features/covenant_onboarding/presentation/screens/covenant_onboarding_screen.dart';
import '../../features/formation_layer/presentation/screens/come_to_the_table_screen.dart';
import '../../features/formation_layer/presentation/screens/formation_home_screen.dart';
import '../../features/formation_layer/presentation/screens/harvest_and_hymn_screen.dart';
import '../../features/language_module/presentation/screens/language_module_home_screen.dart';
import '../screens/covenant_home_screen.dart';

/// Route paths used throughout the application.
abstract final class CovenantRoutePaths {
  static const String root = '/';
  static const String covenant = '/covenant';
  static const String acceptInvite = '/covenant/accept-invite';
  static const String onboarding = '/covenant/onboarding';
  static const String formation = '/covenant/formation';
  static const String comeToTheTable = '/covenant/formation/come-to-the-table';
  static const String harvestAndHymn = '/covenant/formation/harvest-and-hymn';
  static const String berean = '/covenant/berean';
  static const String language = '/covenant/language';
  static const String forum = '/covenant/forum';
}

/// Builds the [GoRouter] for CovenantOS.
///
/// ## Auth and entitlement guards
///
/// Routes under `/covenant` (except `/covenant/accept-invite`) require:
/// 1. An authenticated Supabase session, AND
/// 2. The `os.covenant` entitlement in the user's `app_metadata`.
///
/// Unauthenticated users are redirected to `/covenant/accept-invite`.
/// Authenticated users without `os.covenant` are also redirected there,
/// since an invite is the only path to provisioning the entitlement.
///
/// ## Invite token flow
///
/// Deep links arrive as `/covenant/accept-invite?token=<TOKEN>`. The
/// [AcceptInviteScreen] reads the `token` query parameter and calls
/// [InviteRepository.redeemInvite] to redeem the invite, then refreshes
/// the session and navigates to `/covenant/onboarding`.
GoRouter buildCovenantRouter() {
  final entitlementService = const EntitlementService();

  String? guardCovenant(BuildContext context, GoRouterState state) {
    // When Supabase is not configured (e.g. tests, demo mode), allow all
    // routes through without an entitlement check.
    if (!AppConfig.isConfigured) return null;

    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      // Not authenticated — bounce to accept-invite
      return CovenantRoutePaths.acceptInvite;
    }
    if (!entitlementService.hasCovenant()) {
      // Authenticated but no covenant entitlement — bounce to accept-invite
      return CovenantRoutePaths.acceptInvite;
    }
    return null; // access granted
  }

  return GoRouter(
    initialLocation: CovenantRoutePaths.covenant,
    routes: [
      GoRoute(
        path: CovenantRoutePaths.root,
        redirect: (_, __) => CovenantRoutePaths.covenant,
      ),

      // ── Accept invite (no guard — publicly reachable via deep link) ────
      GoRoute(
        path: CovenantRoutePaths.acceptInvite,
        builder: (context, state) {
          final token = state.uri.queryParameters['token'] ?? '';
          return AcceptInviteScreen(token: token);
        },
      ),

      // ── Post-acceptance onboarding (requires covenant entitlement) ─────
      GoRoute(
        path: CovenantRoutePaths.onboarding,
        redirect: guardCovenant,
        builder: (context, state) => const CovenantOnboardingScreen(),
      ),

      // ── Covenant home ──────────────────────────────────────────────────
      GoRoute(
        path: CovenantRoutePaths.covenant,
        redirect: guardCovenant,
        builder: (context, state) => const CovenantHomeScreen(),
      ),

      // ── Formation Layer ────────────────────────────────────────────────
      GoRoute(
        path: CovenantRoutePaths.formation,
        redirect: guardCovenant,
        builder: (context, state) => const FormationHomeScreen(),
      ),
      GoRoute(
        path: CovenantRoutePaths.comeToTheTable,
        redirect: guardCovenant,
        builder: (context, state) => const ComeToTheTableScreen(),
      ),
      GoRoute(
        path: CovenantRoutePaths.harvestAndHymn,
        redirect: guardCovenant,
        builder: (context, state) => const HarvestAndHymnScreen(),
      ),

      // ── Berean Tool ────────────────────────────────────────────────────
      GoRoute(
        path: CovenantRoutePaths.berean,
        redirect: guardCovenant,
        builder: (context, state) => const BereanHomeScreen(),
      ),

      // ── Language Module ────────────────────────────────────────────────
      GoRoute(
        path: CovenantRoutePaths.language,
        redirect: guardCovenant,
        builder: (context, state) => const LanguageModuleHomeScreen(),
      ),

      // ── Covenant Forum ─────────────────────────────────────────────────
      GoRoute(
        path: CovenantRoutePaths.forum,
        redirect: guardCovenant,
        builder: (context, state) => const CovenantForumHomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'This page does not exist.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go(CovenantRoutePaths.covenant),
              child: const Text('Go to CovenantOS Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
