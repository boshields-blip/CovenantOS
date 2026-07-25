import 'package:covenant_os/features/berean_tool/domain/models/berean_session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BereanSession', () {
    test('fromMap parses required fields correctly', () {
      final map = {
        'id': 'abc123',
        'workspace_id': 'ws1',
        'passage': 'Romans 12:1-2',
        'conducted_at': '2026-07-25T10:00:00.000Z',
      };

      final session = BereanSession.fromMap(map);

      expect(session.id, 'abc123');
      expect(session.workspaceId, 'ws1');
      expect(session.passage, 'Romans 12:1-2');
      expect(session.conductedAt, DateTime.parse('2026-07-25T10:00:00.000Z'));
      expect(session.observations, isNull);
      expect(session.interpretation, isNull);
      expect(session.application, isNull);
      expect(session.groupId, isNull);
      expect(session.conductedBy, isNull);
    });

    test('fromMap parses all optional OIA fields', () {
      final map = {
        'id': 'abc123',
        'workspace_id': 'ws1',
        'passage': 'Hebrews 11:1',
        'conducted_at': '2026-07-25T10:00:00.000Z',
        'group_id': 'grp1',
        'observations': 'Faith is the substance of things hoped for.',
        'interpretation': 'A definition of faith given by contrast with sight.',
        'application': 'Live by trust, not by what is seen.',
        'conducted_by': 'user1',
        'created_at': '2026-07-25T10:01:00.000Z',
        'deleted_at': null,
      };

      final session = BereanSession.fromMap(map);

      expect(session.groupId, 'grp1');
      expect(session.observations, 'Faith is the substance of things hoped for.');
      expect(session.interpretation, 'A definition of faith given by contrast with sight.');
      expect(session.application, 'Live by trust, not by what is seen.');
      expect(session.conductedBy, 'user1');
      expect(session.createdAt, isNotNull);
      expect(session.deletedAt, isNull);
    });

    test('isActive returns true when deletedAt is null', () {
      final session = BereanSession(
        id: 'x',
        workspaceId: 'ws',
        passage: 'John 1:1',
        conductedAt: DateTime.now(),
      );
      expect(session.isActive, isTrue);
    });

    test('isActive returns false when deletedAt is set', () {
      final session = BereanSession(
        id: 'x',
        workspaceId: 'ws',
        passage: 'John 1:1',
        conductedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      );
      expect(session.isActive, isFalse);
    });

    test('toInsertMap includes required fields and omits null optionals', () {
      final session = BereanSession(
        id: '',
        workspaceId: 'ws1',
        passage: 'Psalm 23:1',
        conductedAt: DateTime.parse('2026-07-25T10:00:00.000Z'),
      );

      final map = session.toInsertMap();

      expect(map['workspace_id'], 'ws1');
      expect(map['passage'], 'Psalm 23:1');
      expect(map.containsKey('group_id'), isFalse);
      expect(map.containsKey('observations'), isFalse);
      expect(map.containsKey('interpretation'), isFalse);
      expect(map.containsKey('application'), isFalse);
    });

    test('toInsertMap includes optional fields when provided', () {
      final session = BereanSession(
        id: '',
        workspaceId: 'ws1',
        passage: 'Psalm 23:1',
        conductedAt: DateTime.now(),
        groupId: 'grp1',
        observations: 'The Lord is my shepherd.',
        interpretation: 'Provision and care.',
        application: 'Rest in provision.',
      );

      final map = session.toInsertMap();

      expect(map['group_id'], 'grp1');
      expect(map['observations'], 'The Lord is my shepherd.');
      expect(map['interpretation'], 'Provision and care.');
      expect(map['application'], 'Rest in provision.');
    });
  });
}
