import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/services/supabase_service.dart';
import '../../domain/models/berean_session.dart';

/// Data access for Berean Tool scripture/text examination sessions.
///
/// Queries are workspace-scoped via Supabase RLS — the backend enforces the
/// `covenant_workspace_members` check. The [workspaceId] parameter on write
/// methods makes the intent explicit in client code as well.
///
/// When [AppConfig.isConfigured] is false (no Supabase env vars), all read
/// operations return empty lists and all writes return an offline placeholder.
/// This keeps the UI renderable without a backend connection.
///
/// Tables used:
///   covenant_berean_sessions — OIA scripture/text examination records
class BereanRepository {
  const BereanRepository();

  SupabaseClient get _client => SupabaseService.client;

  /// Returns active Berean sessions for the current user's workspace,
  /// newest first. Soft-deleted sessions (deleted_at IS NOT NULL) are excluded.
  Future<List<BereanSession>> fetchSessions() async {
    if (!AppConfig.isConfigured) return const [];

    final rows = await _client
        .from('covenant_berean_sessions')
        .select()
        .isFilter('deleted_at', null)
        .order('conducted_at', ascending: false) as List<dynamic>;

    return rows
        .cast<Map<String, dynamic>>()
        .map(BereanSession.fromMap)
        .toList();
  }

  /// Logs a new Berean session and returns the persisted record.
  Future<BereanSession> createSession({
    required String workspaceId,
    required String passage,
    required DateTime conductedAt,
    String? groupId,
    String? observations,
    String? interpretation,
    String? application,
  }) async {
    if (!AppConfig.isConfigured) {
      return BereanSession(
        id: 'offline',
        workspaceId: workspaceId,
        passage: passage,
        conductedAt: conductedAt,
        groupId: groupId,
        observations: observations,
        interpretation: interpretation,
        application: application,
      );
    }

    final inserted = await _client
        .from('covenant_berean_sessions')
        .insert(
          BereanSession(
            id: '',
            workspaceId: workspaceId,
            passage: passage,
            conductedAt: conductedAt,
            groupId: groupId,
            observations: observations,
            interpretation: interpretation,
            application: application,
          ).toInsertMap(),
        )
        .select()
        .single();

    return BereanSession.fromMap(inserted);
  }

  /// Soft-deletes a Berean session by setting `deleted_at`.
  Future<void> deleteSession(String sessionId) async {
    if (!AppConfig.isConfigured) return;

    await _client.from('covenant_berean_sessions').update({
      'deleted_at': DateTime.now().toIso8601String(),
    }).eq('id', sessionId);
  }
}
