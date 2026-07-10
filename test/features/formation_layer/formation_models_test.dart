import 'package:covenant_os/features/formation_layer/domain/models/formation_group.dart';
import 'package:covenant_os/features/formation_layer/domain/models/formation_record.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormationGroup', () {
    test('fromMap parses required fields', () {
      final map = {
        'id': 'group-1',
        'name': 'Morning Covenant',
        'workspace_id': 'ws-1',
        'description': null,
        'created_at': '2026-07-10T12:00:00.000Z',
        'deleted_at': null,
      };

      final group = FormationGroup.fromMap(map);

      expect(group.id, 'group-1');
      expect(group.name, 'Morning Covenant');
      expect(group.workspaceId, 'ws-1');
      expect(group.description, isNull);
      expect(group.isActive, isTrue);
    });

    test('isActive is false when deleted_at is set', () {
      final map = {
        'id': 'group-2',
        'name': 'Archived Group',
        'workspace_id': 'ws-1',
        'description': null,
        'created_at': '2026-07-10T12:00:00.000Z',
        'deleted_at': '2026-07-10T13:00:00.000Z',
      };

      final group = FormationGroup.fromMap(map);
      expect(group.isActive, isFalse);
    });

    test('toInsertMap excludes null description', () {
      const group = FormationGroup(
        id: '',
        name: 'New Group',
        workspaceId: 'ws-1',
      );

      final map = group.toInsertMap();
      expect(map['name'], 'New Group');
      expect(map['workspace_id'], 'ws-1');
      expect(map.containsKey('description'), isFalse);
    });

    test('toInsertMap includes description when present', () {
      const group = FormationGroup(
        id: '',
        name: 'New Group',
        workspaceId: 'ws-1',
        description: 'A weekly gathering',
      );

      final map = group.toInsertMap();
      expect(map['description'], 'A weekly gathering');
    });
  });

  group('FormationRecord', () {
    test('fromMap parses practice correctly', () {
      final map = {
        'id': 'rec-1',
        'group_id': 'group-1',
        'practice': 'come_to_the_table',
        'conducted_at': '2026-07-10T18:00:00.000Z',
        'notes': null,
        'created_at': '2026-07-10T18:01:00.000Z',
      };

      final record = FormationRecord.fromMap(map);

      expect(record.practice, FormationPractice.comeToTheTable);
      expect(record.practice.label, 'Come to the Table');
      expect(record.practice.dbValue, 'come_to_the_table');
    });

    test('fromMap parses harvest_and_hymn practice', () {
      final map = {
        'id': 'rec-2',
        'group_id': 'group-1',
        'practice': 'harvest_and_hymn',
        'conducted_at': '2026-10-01T18:00:00.000Z',
        'notes': 'Autumn gathering',
        'created_at': '2026-10-01T18:01:00.000Z',
      };

      final record = FormationRecord.fromMap(map);

      expect(record.practice, FormationPractice.harvestAndHymn);
      expect(record.practice.label, 'Harvest and Hymn');
      expect(record.notes, 'Autumn gathering');
    });

    test('toInsertMap includes notes when present', () {
      final record = FormationRecord(
        id: '',
        groupId: 'group-1',
        practice: FormationPractice.harvestAndHymn,
        conductedAt: DateTime(2026, 10, 1, 18),
        notes: 'Autumn gathering',
      );

      final map = record.toInsertMap();
      expect(map['notes'], 'Autumn gathering');
      expect(map['practice'], 'harvest_and_hymn');
    });

    test('FormationPracticeLabel.fromDbValue throws on unknown value', () {
      expect(
        () => FormationPracticeLabel.fromDbValue('unknown_value'),
        throwsArgumentError,
      );
    });
  });
}
