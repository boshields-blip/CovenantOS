/// A Berean Tool scripture/text examination session.
///
/// Maps to the `covenant_berean_sessions` table in the shared Supabase project.
/// Stores the passage examined and the three OIA (Observe, Interpret, Apply)
/// response fields for a single study session.
class BereanSession {
  const BereanSession({
    required this.id,
    required this.workspaceId,
    required this.passage,
    required this.conductedAt,
    this.groupId,
    this.observations,
    this.interpretation,
    this.application,
    this.conductedBy,
    this.createdAt,
    this.deletedAt,
  });

  factory BereanSession.fromMap(Map<String, dynamic> map) {
    return BereanSession(
      id: map['id'] as String,
      workspaceId: map['workspace_id'] as String,
      passage: map['passage'] as String,
      conductedAt: DateTime.parse(map['conducted_at'] as String),
      groupId: map['group_id'] as String?,
      observations: map['observations'] as String?,
      interpretation: map['interpretation'] as String?,
      application: map['application'] as String?,
      conductedBy: map['conducted_by'] as String?,
      createdAt: map['created_at'] == null
          ? null
          : DateTime.parse(map['created_at'] as String),
      deletedAt: map['deleted_at'] == null
          ? null
          : DateTime.parse(map['deleted_at'] as String),
    );
  }

  final String id;
  final String workspaceId;
  final String passage;
  final DateTime conductedAt;
  final String? groupId;
  final String? observations;
  final String? interpretation;
  final String? application;
  final String? conductedBy;
  final DateTime? createdAt;
  final DateTime? deletedAt;

  bool get isActive => deletedAt == null;

  Map<String, dynamic> toInsertMap() {
    return {
      'workspace_id': workspaceId,
      'passage': passage,
      'conducted_at': conductedAt.toIso8601String(),
      if (groupId != null) 'group_id': groupId,
      if (observations != null) 'observations': observations,
      if (interpretation != null) 'interpretation': interpretation,
      if (application != null) 'application': application,
    };
  }
}
