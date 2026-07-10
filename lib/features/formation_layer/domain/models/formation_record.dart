/// The practice type for a formation record.
enum FormationPractice {
  comeToTheTable,
  harvestAndHymn,
}

extension FormationPracticeLabel on FormationPractice {
  String get label {
    switch (this) {
      case FormationPractice.comeToTheTable:
        return 'Come to the Table';
      case FormationPractice.harvestAndHymn:
        return 'Harvest and Hymn';
    }
  }

  String get dbValue {
    switch (this) {
      case FormationPractice.comeToTheTable:
        return 'come_to_the_table';
      case FormationPractice.harvestAndHymn:
        return 'harvest_and_hymn';
    }
  }

  static FormationPractice fromDbValue(String value) {
    switch (value) {
      case 'come_to_the_table':
        return FormationPractice.comeToTheTable;
      case 'harvest_and_hymn':
        return FormationPractice.harvestAndHymn;
      default:
        throw ArgumentError('Unknown practice: $value');
    }
  }
}

/// A record of a completed formation session.
///
/// Maps to the `covenant_formation_records` table in the shared Supabase project.
class FormationRecord {
  const FormationRecord({
    required this.id,
    required this.groupId,
    required this.practice,
    required this.conductedAt,
    this.notes,
    this.createdAt,
  });

  factory FormationRecord.fromMap(Map<String, dynamic> map) {
    return FormationRecord(
      id: map['id'] as String,
      groupId: map['group_id'] as String,
      practice: FormationPracticeLabel.fromDbValue(
        map['practice'] as String,
      ),
      conductedAt: DateTime.parse(map['conducted_at'] as String),
      notes: map['notes'] as String?,
      createdAt: map['created_at'] == null
          ? null
          : DateTime.parse(map['created_at'] as String),
    );
  }

  final String id;
  final String groupId;
  final FormationPractice practice;
  final DateTime conductedAt;
  final String? notes;
  final DateTime? createdAt;

  Map<String, dynamic> toInsertMap() {
    return {
      'group_id': groupId,
      'practice': practice.dbValue,
      'conducted_at': conductedAt.toIso8601String(),
      if (notes != null) 'notes': notes,
    };
  }
}
