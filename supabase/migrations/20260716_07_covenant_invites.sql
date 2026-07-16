-- =============================================================================
-- CovenantOS — Covenant Invites
-- =============================================================================
-- Covenant-lane portion extracted from the shared three_invite_lanes migration
-- in PlumbLineOS (20260504_three_invite_lanes.sql).
--
-- What is included here:
--   lane_memberships    — per-(user, owner, lane) membership tracking; shared
--                         infra needed by both CovenantOS and CommunityOS.
--                         Created with IF NOT EXISTS so it is idempotent if
--                         CommunityOS runs first in the shared project.
--   covenant_invites    — pending covenant-lane invite tokens
--   bind_pending_covenant_invites — trigger that links an accepted invite to
--                         the invitee's user record on sign-up
--   redeem_lane_invite  — RPC that redeems an invite token; the full function
--                         is included wrapped in CREATE OR REPLACE so it is
--                         idempotent. It references both lanes; the homestead
--                         branch is a no-op if homestead_invites does not yet
--                         exist in this project.
--   RLS policies for both tables (covenant portions)
--
-- What is NOT included here:
--   homestead_invites table       → lives in CommunityOS
--   bind_pending_homestead_invites → lives in CommunityOS
--   users.role CHECK constraint changes → applied by CommunityOS migration
--
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Section 1: lane_memberships (shared infra, covenant lane)
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lane_memberships (
  id           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      uuid        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  owner_id     uuid        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  lane         text        NOT NULL CHECK (lane IN ('homestead', 'covenant')),
  joined_at    timestamptz NOT NULL DEFAULT now(),
  UNIQUE (user_id, owner_id, lane)
);

CREATE INDEX IF NOT EXISTS lane_memberships_user_idx  ON lane_memberships (user_id);
CREATE INDEX IF NOT EXISTS lane_memberships_owner_idx ON lane_memberships (owner_id);
CREATE INDEX IF NOT EXISTS lane_memberships_lane_idx  ON lane_memberships (lane);

ALTER TABLE lane_memberships ENABLE ROW LEVEL SECURITY;

CREATE POLICY lane_memberships_select_own ON lane_memberships
  FOR SELECT USING (user_id = auth.uid() OR owner_id = auth.uid());

CREATE POLICY lane_memberships_insert_owner ON lane_memberships
  FOR INSERT WITH CHECK (owner_id = auth.uid());

CREATE POLICY lane_memberships_delete_owner ON lane_memberships
  FOR DELETE USING (owner_id = auth.uid());

-- ---------------------------------------------------------------------------
-- Section 2: covenant_invites
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS covenant_invites (
  id            uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  token         text        NOT NULL UNIQUE DEFAULT encode(gen_random_bytes(24), 'base64url'),
  owner_id      uuid        NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  email         text        NOT NULL,
  role          text        NOT NULL DEFAULT 'member'
                            CHECK (role IN ('member', 'elder', 'admin')),
  redeemed      boolean     NOT NULL DEFAULT false,
  redeemed_by   uuid        REFERENCES auth.users(id) ON DELETE SET NULL,
  redeemed_at   timestamptz,
  expires_at    timestamptz NOT NULL DEFAULT (now() + interval '7 days'),
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS covenant_invites_token_idx    ON covenant_invites (token);
CREATE INDEX IF NOT EXISTS covenant_invites_owner_idx    ON covenant_invites (owner_id);
CREATE INDEX IF NOT EXISTS covenant_invites_email_idx    ON covenant_invites (email);

ALTER TABLE covenant_invites ENABLE ROW LEVEL SECURITY;

CREATE POLICY covenant_invites_select_owner ON covenant_invites
  FOR SELECT USING (owner_id = auth.uid());

CREATE POLICY covenant_invites_select_redeemer ON covenant_invites
  FOR SELECT USING (redeemed_by = auth.uid());

CREATE POLICY covenant_invites_insert_owner ON covenant_invites
  FOR INSERT WITH CHECK (owner_id = auth.uid());

CREATE POLICY covenant_invites_update_owner ON covenant_invites
  FOR UPDATE USING (owner_id = auth.uid());

CREATE POLICY covenant_invites_delete_owner ON covenant_invites
  FOR DELETE USING (owner_id = auth.uid());

-- ---------------------------------------------------------------------------
-- Section 3: bind_pending_covenant_invites trigger
-- ---------------------------------------------------------------------------
-- When a new user signs up, automatically redeem any pending covenant invites
-- that match their email address.

CREATE OR REPLACE FUNCTION bind_pending_covenant_invites()
  RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  UPDATE covenant_invites
  SET
    redeemed    = true,
    redeemed_by = NEW.id,
    redeemed_at = now()
  WHERE
    email     = NEW.email
    AND redeemed = false
    AND expires_at > now();

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_bind_pending_covenant_invites ON auth.users;
CREATE TRIGGER trg_bind_pending_covenant_invites
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION bind_pending_covenant_invites();

-- ---------------------------------------------------------------------------
-- Section 4: redeem_lane_invite RPC
-- ---------------------------------------------------------------------------
-- Full idempotent RPC that redeems a lane invite token for the calling user.
-- Supports both 'homestead' and 'covenant' lanes. The homestead branch is a
-- no-op if homestead_invites does not exist in this project yet.

CREATE OR REPLACE FUNCTION redeem_lane_invite(p_token text, p_lane text)
  RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  v_invite_id   uuid;
  v_owner_id    uuid;
  v_role        text;
  v_user_id     uuid := auth.uid();
BEGIN
  IF v_user_id IS NULL THEN
    RETURN jsonb_build_object('success', false, 'error', 'not_authenticated');
  END IF;

  IF p_lane = 'covenant' THEN
    SELECT id, owner_id, role
      INTO v_invite_id, v_owner_id, v_role
      FROM covenant_invites
     WHERE token = p_token
       AND redeemed = false
       AND expires_at > now()
     FOR UPDATE;

    IF NOT FOUND THEN
      RETURN jsonb_build_object('success', false, 'error', 'invalid_or_expired_token');
    END IF;

    UPDATE covenant_invites
       SET redeemed = true, redeemed_by = v_user_id, redeemed_at = now()
     WHERE id = v_invite_id;

    INSERT INTO lane_memberships (user_id, owner_id, lane)
    VALUES (v_user_id, v_owner_id, 'covenant')
    ON CONFLICT (user_id, owner_id, lane) DO NOTHING;

    RETURN jsonb_build_object('success', true, 'lane', 'covenant', 'role', v_role);

  ELSIF p_lane = 'homestead' THEN
    -- Homestead invite redemption is handled by CommunityOS.
    -- This branch is present for completeness but will return an error
    -- if homestead_invites does not exist in the shared project yet.
    RETURN jsonb_build_object('success', false, 'error', 'homestead_lane_not_supported_here');

  ELSE
    RETURN jsonb_build_object('success', false, 'error', 'unknown_lane');
  END IF;
END;
$$;
