-- CovenantOS Slice A: covenant_formation_records
-- Stores logs of completed formation sessions (Come to the Table,
-- Harvest and Hymn) for each formation group.

CREATE TABLE IF NOT EXISTS covenant_formation_records (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  group_id     UUID        NOT NULL REFERENCES covenant_formation_groups (id) ON DELETE CASCADE,
  practice     TEXT        NOT NULL CHECK (practice IN ('come_to_the_table', 'harvest_and_hymn')),
  conducted_at TIMESTAMPTZ NOT NULL,
  notes        TEXT,
  logged_by    UUID        REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE covenant_formation_records ENABLE ROW LEVEL SECURITY;

-- Group members may read session records for groups they belong to.
CREATE POLICY "formation_records_select" ON covenant_formation_records
  FOR SELECT
  USING (
    group_id IN (
      SELECT id FROM covenant_formation_groups
      WHERE workspace_id = (
        SELECT workspace_id FROM covenant_workspace_members
        WHERE user_id = auth.uid()
        LIMIT 1
      )
      AND deleted_at IS NULL
    )
  );

-- Group members may log new sessions.
CREATE POLICY "formation_records_insert" ON covenant_formation_records
  FOR INSERT
  WITH CHECK (
    group_id IN (
      SELECT id FROM covenant_formation_groups
      WHERE workspace_id = (
        SELECT workspace_id FROM covenant_workspace_members
        WHERE user_id = auth.uid()
        LIMIT 1
      )
      AND deleted_at IS NULL
    )
    AND logged_by = auth.uid()
  );
