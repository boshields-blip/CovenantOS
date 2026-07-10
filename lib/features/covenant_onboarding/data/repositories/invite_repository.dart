import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/services/supabase_service.dart';

/// Result of an invite redemption attempt.
class InviteRedemptionResult {
  const InviteRedemptionResult({
    required this.success,
    this.errorMessage,
  });

  final bool success;
  final String? errorMessage;
}

/// Repository for accepting a CovenantOS lane invite.
///
/// ## Contract assumptions
///
/// This repository calls the `redeem_lane_invite` RPC that currently lives
/// in PlumbLineOS's shared Supabase project. Once PlumbLineOS PR3 tombstones
/// the covenant invite path, this call will route to the shared-project
/// version of the same RPC.
///
/// Expected RPC signature (documented assumption — see PlumbLineOS
/// `supabase/migrations/20260504_three_invite_lanes.sql`):
/// ```sql
/// redeem_lane_invite(
///   p_token   TEXT,   -- invite token from the invite link
///   p_lane    TEXT    -- 'covenant' for CovenantOS invites
/// ) RETURNS JSONB
/// -- Returns { success: bool, entitlements: string[], error?: string }
/// ```
///
/// If the RPC contract changes, update the parameter names here and in
/// the corresponding migration in this repository's `supabase/migrations/`.
class InviteRepository {
  const InviteRepository();

  /// Redeems a covenant invite [token].
  ///
  /// On success, the backend grants the `os.covenant` entitlement to the
  /// calling user's Identity Spine record. The caller should refresh the
  /// auth session after a successful redemption to pick up the new
  /// entitlement in [currentUser.appMetadata].
  Future<InviteRedemptionResult> redeemInvite(String token) async {
    if (!AppConfig.isConfigured) {
      return const InviteRedemptionResult(
        success: false,
        errorMessage: 'Backend not configured. '
            'Set COVENANT_SUPABASE_URL and COVENANT_SUPABASE_ANON_KEY.',
      );
    }

    try {
      final response = await SupabaseService.client.rpc(
        'redeem_lane_invite',
        params: {
          'p_token': token,
          'p_lane': 'covenant',
        },
      ) as Map<String, dynamic>?;

      if (response == null) {
        return const InviteRedemptionResult(
          success: false,
          errorMessage: 'No response from server.',
        );
      }

      final success = response['success'] as bool? ?? false;
      final error = response['error'] as String?;
      return InviteRedemptionResult(success: success, errorMessage: error);
    } on AuthException catch (e) {
      return InviteRedemptionResult(
        success: false,
        errorMessage: 'Authentication error: ${e.message}',
      );
    } on PostgrestException catch (e) {
      return InviteRedemptionResult(
        success: false,
        errorMessage: 'Server error: ${e.message}',
      );
    } catch (e) {
      return InviteRedemptionResult(
        success: false,
        errorMessage: 'Unexpected error: $e',
      );
    }
  }

  /// Refreshes the current auth session so that newly-granted entitlements
  /// appear in [currentUser.appMetadata] without requiring a sign-out.
  Future<void> refreshSession() async {
    if (!AppConfig.isConfigured) return;
    await SupabaseService.client.auth.refreshSession();
  }
}
