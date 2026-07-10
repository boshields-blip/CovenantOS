-- CovenantOS Slice A: covenant_berean_sessions (stub)
--
-- Stores scripture/text examination sessions run through the Berean Tool.
-- Full session management (passage lookup, OIA templates, cross-reference
-- storage) is planned for Slice B. This migration establishes the table
-- schema so foreign keys and RLS policies can be added incrementally.

CREATE TABLE IF NOT EXISTS covenant_berean_sessions (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  workspace_id UUID        NOT NULL,
  group_id     UUID        REFERENCES covenant_formation_groups (id) ON DELETE SET NULL,
  passage      TEXT        NOT NULL CHECK (char_length(passage) BETWEEN 1 AND 500),
  observations TEXT,
  interpretation TEXT,
  application  TEXT,
  conducted_by UUID        REFERENCES auth.users (id) ON DELETE SET NULL,
  conducted_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at   TIMESTAMPTZ
);

ALTER TABLE covenant_berean_sessions ENABLE ROW LEVEL SECURITY;

-- Members may read sessions in their workspace.
CREATE POLICY "berean_sessions_select" ON covenant_berean_sessions
  FOR SELECT
  USING (workspace_id = (
    SELECT workspace_id FROM covenant_workspace_members
    WHERE user_id = auth.uid()
    LIMIT 1
  ));

-- Authenticated workspace members may create sessions.
CREATE POLICY "berean_sessions_insert" ON covenant_berean_sessions
  FOR INSERT
  WITH CHECK (
    workspace_id = (
      SELECT workspace_id FROM covenant_workspace_members
      WHERE user_id = auth.uid()
      LIMIT 1
    )
    AND conducted_by = auth.uid()
  );
