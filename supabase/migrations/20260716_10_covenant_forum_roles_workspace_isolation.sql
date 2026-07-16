-- =============================================================================
-- CovenantOS — Forum Roles Workspace Isolation
-- =============================================================================
-- Ported from PlumbLineOS
-- 20260715_pr6_001_covenant_forum_roles_workspace_isolation.sql
--
-- Adds workspace_id to covenant_forum_roles so that role assignments are
-- scoped per covenant workspace rather than being global to the user.
-- This is an additive migration: existing rows are backfilled from the
-- covenant_workspace_members table where a match exists.
--
-- Changes:
--   1. Add workspace_id column to covenant_forum_roles (nullable initially
--      to allow backfill without violating existing rows)
--   2. Backfill workspace_id from covenant_workspace_members
--   3. Add workspace-aware RLS policies (additive — original policies remain
--      in place during the transition period)
--   4. Create audit view covenant_forum_roles_null_workspace_inventory to
--      surface rows that could not be backfilled
--
-- Note: The primary key will be redesigned to (user_id, workspace_id) in a
-- future migration once all rows have a non-null workspace_id. That work is
-- tracked as a pending schema change in docs/SUPABASE.md.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Add workspace_id column
-- ---------------------------------------------------------------------------

ALTER TABLE covenant_forum_roles
  ADD COLUMN IF NOT EXISTS workspace_id uuid REFERENCES covenant_workspace_members(workspace_id)
    ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS covenant_forum_roles_workspace_idx
  ON covenant_forum_roles (workspace_id) WHERE workspace_id IS NOT NULL;

-- ---------------------------------------------------------------------------
-- 2. Backfill workspace_id from covenant_workspace_members
-- ---------------------------------------------------------------------------
-- For each role row, find the user's first workspace membership and use that
-- workspace_id. Users who have never joined a workspace will remain NULL.

UPDATE covenant_forum_roles fr
   SET workspace_id = (
     SELECT workspace_id
       FROM covenant_workspace_members cwm
      WHERE cwm.user_id = fr.user_id
      ORDER BY cwm.joined_at ASC
      LIMIT 1
   )
 WHERE fr.workspace_id IS NULL;

-- ---------------------------------------------------------------------------
-- 3. Workspace-aware RLS policies (additive)
-- ---------------------------------------------------------------------------
-- These policies layer workspace scoping on top of the existing role-based
-- policies. They are intentionally additive: the existing policies remain
-- active during the transition period while workspace_id is still nullable.

-- Members may read roles for users in the same workspace
CREATE POLICY covenant_forum_roles_select_workspace ON covenant_forum_roles
  FOR SELECT USING (
    workspace_id IS NOT NULL
    AND workspace_id IN (
      SELECT workspace_id FROM covenant_workspace_members
       WHERE user_id = auth.uid()
    )
  );

-- Admins in the same workspace may write role assignments
CREATE POLICY covenant_forum_roles_write_workspace_admin ON covenant_forum_roles
  FOR ALL
  USING (
    workspace_id IS NOT NULL
    AND workspace_id IN (
      SELECT workspace_id FROM covenant_workspace_members
       WHERE user_id = auth.uid()
    )
    AND EXISTS (
      SELECT 1 FROM covenant_forum_roles r2
       WHERE r2.user_id = auth.uid()
         AND r2.workspace_id = covenant_forum_roles.workspace_id
         AND r2.role = 'admin'
    )
  )
  WITH CHECK (
    workspace_id IS NOT NULL
    AND workspace_id IN (
      SELECT workspace_id FROM covenant_workspace_members
       WHERE user_id = auth.uid()
    )
    AND EXISTS (
      SELECT 1 FROM covenant_forum_roles r2
       WHERE r2.user_id = auth.uid()
         AND r2.workspace_id = covenant_forum_roles.workspace_id
         AND r2.role = 'admin'
    )
  );

-- ---------------------------------------------------------------------------
-- 4. Audit view: rows with no workspace assignment
-- ---------------------------------------------------------------------------

CREATE OR REPLACE VIEW covenant_forum_roles_null_workspace_inventory AS
  SELECT
    fr.user_id,
    fr.role,
    fr.granted_at,
    fr.granted_by
  FROM covenant_forum_roles fr
 WHERE fr.workspace_id IS NULL;

COMMENT ON VIEW covenant_forum_roles_null_workspace_inventory IS
  'Surfaces covenant_forum_roles rows whose workspace_id could not be '
  'backfilled. Rows here should be investigated and assigned a workspace '
  'before the (user_id, workspace_id) PK redesign is applied.';
