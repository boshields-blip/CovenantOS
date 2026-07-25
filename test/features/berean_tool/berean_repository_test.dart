import 'package:covenant_os/features/berean_tool/data/repositories/berean_repository.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Unit tests for BereanRepository in offline/unconfigured mode.
//
// Full integration tests (with a mock SupabaseClient) would require a live
// Supabase setup and are deferred to integration test infrastructure.
// These tests cover the offline guard contract and basic API surface.
// ---------------------------------------------------------------------------

void main() {
  group('BereanRepository — offline/unconfigured guard', () {
    // In the test environment AppConfig.isConfigured is false (no --dart-define
    // vars), so all operations must be safe no-ops.
    const repo = BereanRepository();

    test('fetchSessions returns empty list when not configured', () async {
      final sessions = await repo.fetchSessions();
      expect(sessions, isEmpty);
    });

    test('createSession returns offline placeholder when not configured',
        () async {
      final session = await repo.createSession(
        workspaceId: 'ws1',
        passage: 'Romans 8:28',
        conductedAt: DateTime.now(),
      );
      expect(session.id, 'offline');
      expect(session.passage, 'Romans 8:28');
      expect(session.workspaceId, 'ws1');
    });

    test('createSession preserves all OIA fields in offline mode', () async {
      final session = await repo.createSession(
        workspaceId: 'ws1',
        passage: 'Philippians 4:6-7',
        conductedAt: DateTime.now(),
        observations: 'Do not be anxious about anything.',
        interpretation: 'A command, not a suggestion.',
        application: 'Bring specific worries to God in prayer.',
      );
      expect(session.observations, 'Do not be anxious about anything.');
      expect(session.interpretation, 'A command, not a suggestion.');
      expect(session.application, 'Bring specific worries to God in prayer.');
    });

    test('deleteSession completes without throwing when not configured',
        () async {
      await expectLater(repo.deleteSession('any-id'), completes);
    });
  });
}
