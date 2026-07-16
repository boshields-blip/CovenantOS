-- =============================================================================
-- CovenantOS — Covenant Teaching Shares
-- =============================================================================
-- Ported from PlumbLineOS 20260606_001_covenant_teaching_shares.sql
--
-- Creates the covenant_teaching_shares table and supporting RPCs for
-- generating and resolving shareable links to CovenantOS teaching content.
-- Shareable links allow an authenticated user to share a specific teaching
-- path with an unauthenticated or external recipient via a short token.
--
-- Tables:
--   covenant_teaching_shares  — shareable link records with token + path
--
-- Functions:
--   is_covenant_teaching_shareable_path()  — guard: validates path format
--   create_covenant_teaching_share()       — RPC: creates a share record
--   resolve_covenant_teaching_share()      — RPC: resolves a token to a path
-- =============================================================================

CREATE TABLE IF NOT EXISTS covenant_teaching_shares (
  id           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  token        text        NOT NULL UNIQUE DEFAULT encode(gen_random_bytes(16), 'base64url'),
  owner_id     uuid        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  content_path text        NOT NULL,
  label        text,
  view_count   integer     NOT NULL DEFAULT 0,
  expires_at   timestamptz,
  created_at   timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS covenant_teaching_shares_token_idx
  ON covenant_teaching_shares (token);

CREATE INDEX IF NOT EXISTS covenant_teaching_shares_owner_idx
  ON covenant_teaching_shares (owner_id);

CREATE INDEX IF NOT EXISTS covenant_teaching_shares_path_idx
  ON covenant_teaching_shares (content_path);

ALTER TABLE covenant_teaching_shares ENABLE ROW LEVEL SECURITY;

-- ---------------------------------------------------------------------------
-- Helper: validate that a content_path looks like a CovenantOS teaching path
-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION is_covenant_teaching_shareable_path(p_path text)
  RETURNS boolean LANGUAGE sql IMMUTABLE AS $$
  SELECT p_path ~ '^covenant/(academy|berean|formation|language|philosophy)/[a-z0-9_\-/]+$';
$$;

-- ---------------------------------------------------------------------------
-- RPC: create_covenant_teaching_share
-- ---------------------------------------------------------------------------
-- Creates a new shareable link for the given content_path.
-- Returns the token on success or an error payload.

CREATE OR REPLACE FUNCTION create_covenant_teaching_share(
  p_content_path text,
  p_label        text    DEFAULT NULL,
  p_expires_at   timestamptz DEFAULT NULL
)
  RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_token   text;
BEGIN
  IF v_user_id IS NULL THEN
    RETURN jsonb_build_object('success', false, 'error', 'not_authenticated');
  END IF;

  IF NOT is_covenant_teaching_shareable_path(p_content_path) THEN
    RETURN jsonb_build_object('success', false, 'error', 'invalid_content_path');
  END IF;

  INSERT INTO covenant_teaching_shares (owner_id, content_path, label, expires_at)
  VALUES (v_user_id, p_content_path, p_label, p_expires_at)
  RETURNING token INTO v_token;

  RETURN jsonb_build_object('success', true, 'token', v_token);
END;
$$;

-- ---------------------------------------------------------------------------
-- RPC: resolve_covenant_teaching_share
-- ---------------------------------------------------------------------------
-- Resolves a share token to its content_path, incrementing the view count.
-- Returns the path or an error payload.

CREATE OR REPLACE FUNCTION resolve_covenant_teaching_share(p_token text)
  RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  v_record covenant_teaching_shares;
BEGIN
  SELECT * INTO v_record
    FROM covenant_teaching_shares
   WHERE token = p_token
     AND (expires_at IS NULL OR expires_at > now());

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'invalid_or_expired_token');
  END IF;

  UPDATE covenant_teaching_shares
     SET view_count = view_count + 1
   WHERE id = v_record.id;

  RETURN jsonb_build_object(
    'success',      true,
    'content_path', v_record.content_path,
    'label',        v_record.label,
    'owner_id',     v_record.owner_id
  );
END;
$$;

-- ---------------------------------------------------------------------------
-- RLS policies
-- ---------------------------------------------------------------------------

-- Owners can read their own shares
CREATE POLICY covenant_teaching_shares_select_own ON covenant_teaching_shares
  FOR SELECT USING (owner_id = auth.uid());

-- Owners can create shares (path validation happens in the RPC, but also
-- enforce it here as a defence-in-depth policy)
CREATE POLICY covenant_teaching_shares_insert_own ON covenant_teaching_shares
  FOR INSERT WITH CHECK (
    owner_id = auth.uid()
    AND is_covenant_teaching_shareable_path(content_path)
  );

-- Owners can update their own shares
CREATE POLICY covenant_teaching_shares_update_own ON covenant_teaching_shares
  FOR UPDATE USING (owner_id = auth.uid());

-- Owners can delete their own shares
CREATE POLICY covenant_teaching_shares_delete_own ON covenant_teaching_shares
  FOR DELETE USING (owner_id = auth.uid());

-- ---------------------------------------------------------------------------
-- GRANTs
-- ---------------------------------------------------------------------------

GRANT EXECUTE ON FUNCTION is_covenant_teaching_shareable_path(text)     TO authenticated;
GRANT EXECUTE ON FUNCTION create_covenant_teaching_share(text, text, timestamptz) TO authenticated;
GRANT EXECUTE ON FUNCTION resolve_covenant_teaching_share(text)          TO authenticated, anon;
