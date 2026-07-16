-- =============================================================================
-- CovenantOS — Forum 3-Pane
-- =============================================================================
-- Adds tool_key and is_personal columns to covenant_forum_posts to support
-- the 3-pane forum layout:
--   tool_key    — optional link to the CovenantOS tool that prompted the post
--                 (e.g. berean_tool, come_to_the_table)
--   is_personal — when true, post is only visible to the author and elevated
--                 roles; public posts have is_personal = false (the default)
--
-- Also adds supporting indexes and replaces the broad published-post select
-- policy with one that respects personal-post visibility.

ALTER TABLE covenant_forum_posts
  ADD COLUMN IF NOT EXISTS tool_key   text,
  ADD COLUMN IF NOT EXISTS is_personal boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_forum_posts_tool_key
  ON covenant_forum_posts (tool_key) WHERE tool_key IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_forum_posts_passage_ref
  ON covenant_forum_posts (passage_ref) WHERE passage_ref IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_forum_posts_is_personal
  ON covenant_forum_posts (is_personal);

DROP POLICY IF EXISTS "Forum posts are visible when published" ON covenant_forum_posts;

CREATE POLICY "Forum posts select policy"
  ON covenant_forum_posts FOR SELECT
  USING (
    is_published = true
    AND (
      is_personal = false
      OR author_id = auth.uid()
      OR EXISTS (
        SELECT 1 FROM covenant_forum_roles r
        WHERE r.user_id = auth.uid()
          AND r.role IN ('responder', 'teacher', 'elder', 'admin')
      )
    )
  );
