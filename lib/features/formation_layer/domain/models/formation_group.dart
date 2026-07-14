/// A formation group — a community of users engaging in formation practices.
///
/// Maps to the `covenant_formation_groups` table in the shared Supabase project.
class FormationGroup {
  const FormationGroup({
    required this.id,
    required this.name,
    required this.workspaceId,
    this.description,
    this.createdAt,
    this.deletedAt,
  });

  factory FormationGroup.fromMap(Map<String, dynamic> map) {
    return FormationGroup(
      id: map['id'] as String,
      name: map['name'] as String,
      workspaceId: map['workspace_id'] as String,
      description: map['description'] as String?,
      createdAt: map['created_at'] == null
          ? null
          : DateTime.parse(map['created_at'] as String),
      deletedAt: map['deleted_at'] == null
          ? null
          : DateTime.parse(map['deleted_at'] as String),
    );
  }

  final String id;
  final String name;
  final String workspaceId;
  final String? description;
  final DateTime? createdAt;
  final DateTime? deletedAt;

  bool get isActive => deletedAt == null;

  Map<String, dynamic> toInsertMap() {
    return {
      'name': name,
      'workspace_id': workspaceId,
      if (description != null) 'description': description,
    };
  }
}
