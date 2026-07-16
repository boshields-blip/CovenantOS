-- =============================================================================
-- CovenantOS — Covenant Invite Auth-Profile Alignment Fix
-- =============================================================================
-- Ported from PlumbLineOS 20260505_fix_covenant_invite_auth_profile_alignment.sql
--
-- Fixes the handle_new_user() trigger so that newly created users get their
-- profile row created correctly after the invite-lane provisioning was added.
-- Also extends the users_pending.requested_role CHECK constraint to include
-- 'homestead' and 'covenant' as valid values (shared project concern).
--
-- Wrapped in BEGIN/COMMIT for atomic application.
-- =============================================================================

BEGIN;

-- ---------------------------------------------------------------------------
-- 1. Fix handle_new_user trigger
-- ---------------------------------------------------------------------------
-- Recreate the trigger function to ensure the profile row is inserted with
-- the correct defaults after the invite-lane tables were added. The previous
-- version did not account for the lane assignment that happens in
-- bind_pending_covenant_invites / bind_pending_homestead_invites.

CREATE OR REPLACE FUNCTION handle_new_user()
  RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name, created_at)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email, '@', 1)),
    now()
  )
  ON CONFLICT (id) DO NOTHING;

  RETURN NEW;
END;
$$;

-- Ensure the trigger exists and is wired to auth.users
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- ---------------------------------------------------------------------------
-- 2. Extend users_pending.requested_role CHECK constraint
-- ---------------------------------------------------------------------------
-- Add 'homestead' and 'covenant' as valid requested_role values so that
-- invite-lane pre-registration records can specify which product the pending
-- user is joining.
--
-- Uses a constraint rename+replace pattern to remain idempotent.

ALTER TABLE IF EXISTS users_pending
  DROP CONSTRAINT IF EXISTS users_pending_requested_role_check;

ALTER TABLE IF EXISTS users_pending
  ADD CONSTRAINT users_pending_requested_role_check
  CHECK (requested_role IN ('member', 'admin', 'homestead', 'covenant'));

COMMIT;
