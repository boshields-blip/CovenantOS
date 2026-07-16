-- =============================================================================
-- CovenantOS — Covenant Forum
-- =============================================================================
-- Creates the three tables that back the Community Forum feature:
--   covenant_forum_roles    — per-user role assignments (reader / responder / teacher / elder / admin)
--   covenant_forum_posts    — reflection papers, questions, and discussion threads
--   covenant_forum_replies  — responses, restricted to elevated roles via RLS
--
-- Role rules
--   reader    — default for every authenticated user; may create posts, cannot reply
--   responder — may create replies; granted by admin
--   teacher   — may create + endorse replies; granted by admin
--   elder     — same as teacher; granted by admin
--   admin     — full CRUD on all tables

CREATE TABLE IF NOT EXISTS covenant_forum_roles (
  user_id     uuid        PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  role        text        NOT NULL DEFAULT 'reader'
                          CHECK (role IN ('reader', 'responder', 'teacher', 'elder', 'admin')),
  granted_at  timestamptz NOT NULL DEFAULT now(),
  granted_by  uuid        REFERENCES auth.users(id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS covenant_forum_roles_role_idx ON covenant_forum_roles (role);

CREATE OR REPLACE FUNCTION is_covenant_responder(uid uuid)
  RETURNS boolean LANGUAGE sql SECURITY DEFINER AS $$
  SELECT EXISTS (
    SELECT 1 FROM covenant_forum_roles
    WHERE user_id = uid AND role IN ('responder', 'teacher', 'elder', 'admin')
  );
$$;

ALTER TABLE covenant_forum_roles ENABLE ROW LEVEL SECURITY;

CREATE POLICY covenant_forum_roles_select_own ON covenant_forum_roles
  FOR SELECT USING (user_id = auth.uid());

CREATE POLICY covenant_forum_roles_select_admin ON covenant_forum_roles
  FOR SELECT USING (is_covenant_responder(auth.uid())
         AND EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin'));

CREATE POLICY covenant_forum_roles_write_admin ON covenant_forum_roles
  FOR ALL
  USING (EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin'))
  WITH CHECK (EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin'));

CREATE TABLE IF NOT EXISTS covenant_forum_posts (
  id           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  author_id    uuid        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  author_name  text        NOT NULL,
  type         text        NOT NULL DEFAULT 'discussion'
                           CHECK (type IN ('reflection', 'question', 'discussion')),
  title        text        NOT NULL,
  body         text        NOT NULL,
  passage_ref  text,
  domain_keys  text[]      NOT NULL DEFAULT '{}',
  is_published boolean     NOT NULL DEFAULT true,
  reply_count  integer     NOT NULL DEFAULT 0,
  view_count   integer     NOT NULL DEFAULT 0,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz
);

CREATE INDEX IF NOT EXISTS covenant_forum_posts_author_idx   ON covenant_forum_posts (author_id);
CREATE INDEX IF NOT EXISTS covenant_forum_posts_type_idx     ON covenant_forum_posts (type);
CREATE INDEX IF NOT EXISTS covenant_forum_posts_created_idx  ON covenant_forum_posts (created_at DESC);

ALTER TABLE covenant_forum_posts ENABLE ROW LEVEL SECURITY;

CREATE POLICY covenant_forum_posts_select ON covenant_forum_posts
  FOR SELECT USING (auth.uid() IS NOT NULL AND is_published = true);

CREATE POLICY covenant_forum_posts_select_own_draft ON covenant_forum_posts
  FOR SELECT USING (author_id = auth.uid());

CREATE POLICY covenant_forum_posts_insert ON covenant_forum_posts
  FOR INSERT WITH CHECK (auth.uid() IS NOT NULL AND author_id = auth.uid());

CREATE POLICY covenant_forum_posts_update ON covenant_forum_posts
  FOR UPDATE USING (
    author_id = auth.uid()
    OR EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin')
  );

CREATE POLICY covenant_forum_posts_delete ON covenant_forum_posts
  FOR DELETE USING (
    author_id = auth.uid()
    OR EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin')
  );

CREATE TABLE IF NOT EXISTS covenant_forum_replies (
  id           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  post_id      uuid        NOT NULL REFERENCES covenant_forum_posts(id) ON DELETE CASCADE,
  author_id    uuid        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  author_name  text        NOT NULL,
  body         text        NOT NULL,
  is_endorsed  boolean     NOT NULL DEFAULT false,
  endorsed_by  uuid        REFERENCES auth.users(id) ON DELETE SET NULL,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz
);

CREATE INDEX IF NOT EXISTS covenant_forum_replies_post_idx    ON covenant_forum_replies (post_id);
CREATE INDEX IF NOT EXISTS covenant_forum_replies_author_idx  ON covenant_forum_replies (author_id);
CREATE INDEX IF NOT EXISTS covenant_forum_replies_created_idx ON covenant_forum_replies (created_at ASC);

ALTER TABLE covenant_forum_replies ENABLE ROW LEVEL SECURITY;

CREATE POLICY covenant_forum_replies_select ON covenant_forum_replies
  FOR SELECT USING (auth.uid() IS NOT NULL);

CREATE POLICY covenant_forum_replies_insert ON covenant_forum_replies
  FOR INSERT WITH CHECK (author_id = auth.uid() AND is_covenant_responder(auth.uid()));

CREATE POLICY covenant_forum_replies_update ON covenant_forum_replies
  FOR UPDATE USING (
    author_id = auth.uid()
    OR EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin')
  );

CREATE POLICY covenant_forum_replies_delete ON covenant_forum_replies
  FOR DELETE USING (
    author_id = auth.uid()
    OR EXISTS (SELECT 1 FROM covenant_forum_roles WHERE user_id = auth.uid() AND role = 'admin')
  );

CREATE OR REPLACE FUNCTION increment_forum_reply_count()
  RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN
  UPDATE covenant_forum_posts SET reply_count = reply_count + 1 WHERE id = NEW.post_id;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_increment_reply_count ON covenant_forum_replies;
CREATE TRIGGER trg_increment_reply_count
  AFTER INSERT ON covenant_forum_replies
  FOR EACH ROW EXECUTE FUNCTION increment_forum_reply_count();

CREATE OR REPLACE FUNCTION decrement_forum_reply_count()
  RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN
  UPDATE covenant_forum_posts SET reply_count = GREATEST(0, reply_count - 1) WHERE id = OLD.post_id;
  RETURN OLD;
END;
$$;

DROP TRIGGER IF EXISTS trg_decrement_reply_count ON covenant_forum_replies;
CREATE TRIGGER trg_decrement_reply_count
  AFTER DELETE ON covenant_forum_replies
  FOR EACH ROW EXECUTE FUNCTION decrement_forum_reply_count();
