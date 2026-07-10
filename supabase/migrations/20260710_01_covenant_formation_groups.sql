-- CovenantOS Slice A: covenant_formation_groups
-- Stores groups of users engaged in shared formation practices.
-- All tables are workspace-scoped for RLS isolation (see PR1 workspace
-- hardening in PlumbLineOS for the workspace boundary rationale).

CREATE TABLE IF NOT EXISTS covenant_formation_groups (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  workspace_id UUID        NOT NULL,
  name         TEXT        NOT NULL CHECK (char_length(name) BETWEEN 1 AND 120),
  description  TEXT,
  created_by   UUID        REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at   TIMESTAMPTZ            -- soft delete; NULL = active
);

ALTER TABLE covenant_formation_groups ENABLE ROW LEVEL SECURITY;

-- Members may read groups in their workspace.
CREATE POLICY "formation_groups_select" ON covenant_formation_groups
  FOR SELECT
  USING (workspace_id = (
    SELECT workspace_id FROM covenant_workspace_members
    WHERE user_id = auth.uid()
    LIMIT 1
  ));

-- Authenticated workspace members may create groups.
CREATE POLICY "formation_groups_insert" ON covenant_formation_groups
  FOR INSERT
  WITH CHECK (
    workspace_id = (
      SELECT workspace_id FROM covenant_workspace_members
      WHERE user_id = auth.uid()
      LIMIT 1
    )
    AND created_by = auth.uid()
  );

-- Only the creator may soft-delete a group they own.
CREATE POLICY "formation_groups_delete" ON covenant_formation_groups
  FOR UPDATE
  USING (created_by = auth.uid())
  WITH CHECK (created_by = auth.uid());
