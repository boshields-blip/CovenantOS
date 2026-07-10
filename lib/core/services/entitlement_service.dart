import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/app_config.dart';
import 'supabase_service.dart';

/// Checks the Identity Spine entitlement for the current user.
///
/// The `os.covenant` entitlement is stored in the user's app_metadata
/// (set server-side) under the `entitlements` key as a list of strings.
///
/// Example metadata shape:
/// ```json
/// { "entitlements": ["os.covenant"] }
/// ```
///
/// This check is intentionally read-only and safe — it only inspects
/// locally-cached metadata from the current auth session; it does not
/// make an additional network call.
class EntitlementService {
  const EntitlementService();

  static const String covenantEntitlement = 'os.covenant';

  /// Returns true when the current user holds the [covenantEntitlement].
  bool hasCovenant() {
    if (!AppConfig.isConfigured) return false;
    final user = SupabaseService.client.auth.currentUser;
    if (user == null) return false;
    final meta = user.appMetadata;
    final entitlements = meta['entitlements'] as List<dynamic>?;
    return entitlements?.contains(covenantEntitlement) ?? false;
  }

  /// Returns the current [User], or null when not authenticated.
  User? get currentUser {
    if (!AppConfig.isConfigured) return null;
    return SupabaseService.client.auth.currentUser;
  }
}
