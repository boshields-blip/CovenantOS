-- CovenantOS Slice A: covenant_workspace_members
--
-- Lightweight workspace membership table for CovenantOS. A user enters
-- this table when their invite is redeemed (os.covenant entitlement granted
-- via redeem_lane_invite RPC in the shared project).
--
-- NOTE: The authoritative workspace membership record lives in the shared
-- community Supabase project's workspace_memberships table (PlumbLineOS PR1
-- workspace hardening). This table is a CovenantOS-local projection used
-- for RLS policy joins within this product's tables.
--
-- When PlumbLineOS PR3 tombstones the covenant lane, the invite redemption
-- path should write directly to this table (or its shared-project equivalent)
-- rather than going through TradeCore's edge function. See
-- docs/PR3_PLUMBLINEOS_CUTOVER.md.

CREATE TABLE IF NOT EXISTS covenant_workspace_members (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  workspace_id UUID        NOT NULL,
  user_id      UUID        NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  joined_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (workspace_id, user_id)
);

ALTER TABLE covenant_workspace_members ENABLE ROW LEVEL SECURITY;

-- Users may only read their own membership record.
CREATE POLICY "workspace_members_select_own" ON covenant_workspace_members
  FOR SELECT
  USING (user_id = auth.uid());

-- Server-side only for inserts (no client-side insert policy).
-- Membership is granted by invite redemption (run_covenant_setup_hook).
