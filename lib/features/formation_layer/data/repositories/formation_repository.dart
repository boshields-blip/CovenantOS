import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/services/supabase_service.dart';
import '../../domain/models/formation_group.dart';
import '../../domain/models/formation_record.dart';

/// Data access for formation groups and session records.
///
/// All queries are workspace-scoped — the backend enforces this via RLS,
/// but all writes also include [workspaceId] explicitly to keep intent clear.
///
/// When [AppConfig.isConfigured] is false (no Supabase env vars, e.g. in
/// tests or demo mode), all read operations return empty lists and all
/// writes are no-ops. This keeps the UI renderable without a backend.
///
/// Tables used:
///   covenant_formation_groups    — groups of users in shared formation
///   covenant_formation_records   — log of completed formation sessions
class FormationRepository {
  const FormationRepository();

  SupabaseClient get _client => SupabaseService.client;

  // ── Formation Groups ──────────────────────────────────────────────────────

  /// Returns all active formation groups visible to the current user.
  Future<List<FormationGroup>> fetchGroups() async {
    if (!AppConfig.isConfigured) return const [];

    final rows = await _client
        .from('covenant_formation_groups')
        .select()
        .isFilter('deleted_at', null)
        .order('name') as List<dynamic>;

    return rows
        .cast<Map<String, dynamic>>()
        .map(FormationGroup.fromMap)
        .toList();
  }

  /// Creates a new formation group and returns the persisted record.
  Future<FormationGroup> createGroup({
    required String name,
    required String workspaceId,
    String? description,
  }) async {
    if (!AppConfig.isConfigured) {
      // Return an optimistic local value in demo/offline mode.
      return FormationGroup(
        id: 'offline',
        name: name,
        workspaceId: workspaceId,
        description: description,
      );
    }

    final inserted = await _client
        .from('covenant_formation_groups')
        .insert(
          FormationGroup(
            id: '',
            name: name,
            workspaceId: workspaceId,
            description: description,
          ).toInsertMap(),
        )
        .select()
        .single() as Map<String, dynamic>;

    return FormationGroup.fromMap(inserted);
  }

  /// Soft-deletes a formation group by setting [deletedAt].
  Future<void> deleteGroup(String groupId) async {
    if (!AppConfig.isConfigured) return;

    await _client.from('covenant_formation_groups').update({
      'deleted_at': DateTime.now().toIso8601String(),
    }).eq('id', groupId);
  }

  // ── Formation Records ─────────────────────────────────────────────────────

  /// Returns the formation session records for [groupId], newest first.
  Future<List<FormationRecord>> fetchRecordsForGroup(String groupId) async {
    if (!AppConfig.isConfigured) return const [];

    final rows = await _client
        .from('covenant_formation_records')
        .select()
        .eq('group_id', groupId)
        .order('conducted_at', ascending: false) as List<dynamic>;

    return rows
        .cast<Map<String, dynamic>>()
        .map(FormationRecord.fromMap)
        .toList();
  }

  /// Logs a completed formation session.
  Future<FormationRecord> logSession({
    required String groupId,
    required FormationPractice practice,
    required DateTime conductedAt,
    String? notes,
  }) async {
    if (!AppConfig.isConfigured) {
      return FormationRecord(
        id: 'offline',
        groupId: groupId,
        practice: practice,
        conductedAt: conductedAt,
        notes: notes,
      );
    }

    final inserted = await _client
        .from('covenant_formation_records')
        .insert(
          FormationRecord(
            id: '',
            groupId: groupId,
            practice: practice,
            conductedAt: conductedAt,
            notes: notes,
          ).toInsertMap(),
        )
        .select()
        .single() as Map<String, dynamic>;

    return FormationRecord.fromMap(inserted);
  }
}
