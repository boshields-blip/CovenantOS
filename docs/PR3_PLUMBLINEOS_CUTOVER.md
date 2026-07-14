# PlumbLineOS PR3 — Covenant Tombstone / Cutover Actions

**Status:** Pending (to be executed after CovenantOS PR2 merges)  
**Owner:** @boshields-blip  
**Last updated:** 2026-07-10

---

## Purpose

This document describes the exact actions that PlumbLineOS PR3 must take to
tombstone the Covenant formation vertical after this PR (CovenantOS PR2) merges.

CovenantOS now owns Covenant formation runtime. PlumbLineOS PR3 completes the
cutover by removing or redirecting the Covenant paths from TradeCore so that
there are no competing write paths.

---

## PR3 checklist

### 1. Route tombstones

- [ ] In `lib/app/routes/homestead_routes.dart`, replace every `/covenant/**`
  route builder with a tombstone redirect widget that:
  - Shows a brief message: *"Covenant formation has moved to CovenantOS."*
  - Provides a deep link or navigation path to CovenantOS (if deep-link
    infrastructure is available).
  - **Does not** write any data or call any RPC.

- [ ] Remove the `...covenantRoutes` spread (or equivalent) from
  `lib/app/app_router.dart`. Replace with a named constant
  `kCovenantRoutesTombstoned = true` so the removal is searchable.

### 2. Remove feature imports

- [ ] In `lib/features/weekly_ops/presentation/tabs/notes_tab.dart`,
  remove the import of `WeeklyFormationSummaryCard` from
  `lib/features/covenant_os/`. Replace with a plain `SizedBox.shrink()`
  or a stub card that does not depend on the covenant feature tree.

### 3. Remove startup coupling

- [ ] In `lib/main.dart`, remove the `openCovenantHiveBoxes()` call (or
  equivalent) and the `CovenantFormationSeeder.seed()` call. These should
  no longer run at TradeCore startup.

### 4. Remove write paths from onboarding screens

- [ ] In `lib/features/messaging/presentation/screens/covenant_onboarding_screen.dart`,
  replace the `run_covenant_setup_hook` RPC call with a tombstone:
  ```dart
  // TOMBSTONED: Covenant onboarding now handled in CovenantOS.
  // This screen should not be reachable; if it is, redirect to CovenantOS.
  ```
- [ ] Mark `lib/features/messaging/presentation/screens/covenant_onboarding_screen.dart`
  as `@Deprecated` so references are caught at build time.

- [ ] In `lib/core/presentation/screens/accept_invite_screen.dart`, remove
  the `covenant` lane path from the invite redemption branch. The screen
  should only handle `tradecore` lane invites going forward.

### 5. Edge function: remove covenant lane

- [ ] In `supabase/functions/invite-user/index.ts`, remove the `covenant`
  branch from the invite handler. Covenant invites are no longer provisioned
  through the TradeCore edge function.

  **Assumption**: Before removing, confirm that CovenantOS's shared-project
  `redeem_lane_invite` RPC is live and accepting covenant tokens. The
  transition window should overlap by at least one deploy cycle.

- [ ] Update `supabase/functions/invite-user/identity_spine_invite.ts` to
  remove the `os.covenant` entitlement grant path. After PR3, only
  `os.tradecore` (and `os.homestead` until CommunityOS PR4) are granted
  from this function.

### 6. Add deprecation notices to covenant directories

- [ ] Add a `TOMBSTONE.md` to `lib/features/covenant_os/` with content:
  ```markdown
  # TOMBSTONE

  This directory has been moved to `boshields-blip/CovenantOS`.
  Do not add new code here. Existing files are retained only for
  reference during the transition window. They will be deleted in a
  future cleanup PR.

  Moved: 2026-07-10 (CovenantOS PR2)
  ```

- [ ] Add `TOMBSTONE.md` to `covenant_os/` (root directory in PlumbLineOS)
  with equivalent content pointing to this repo.

### 7. Verification

- [ ] `flutter analyze` passes with no covenant-related errors in TradeCore.
- [ ] `flutter test` passes — update any tests that previously exercised
  covenant routes or the `WeeklyFormationSummaryCard`.
- [ ] No RPC calls to `run_covenant_setup_hook` remain in TradeCore code.
- [ ] No writes to covenant tables from TradeCore code remain.

---

## Shared contract assumptions

The following contracts bridge PlumbLineOS and CovenantOS during the
transition. These must be live in the shared Supabase project before PR3
ships:

| Contract | Current home | Required state for PR3 |
|---|---|---|
| `redeem_lane_invite` RPC | PlumbLineOS migrations | Must accept `p_lane = 'covenant'` and write to `covenant_workspace_members` |
| `os.covenant` entitlement grant | PlumbLineOS `invite-user` function | Must be transitioning to shared-project function before PR3 removes the TradeCore path |
| `covenant_formation_groups` table | CovenantOS migrations (this PR) | Must be present in shared Supabase project |
| `covenant_formation_records` table | CovenantOS migrations (this PR) | Must be present in shared Supabase project |
| `covenant_workspace_members` table | CovenantOS migrations (this PR) | Must be present in shared Supabase project |

---

## Follow-up work (not in PR3 scope)

These items are required but not blocked on PR3:

- **API contract relocation** (Issues #9, #10, #11 from the migration
  checklist): move `invite-user` function ownership and `redeem_lane_invite`
  to shared-project infra. This is a separate PR after PR3.
- **CommunityOS PR4**: Homestead extraction (parallel to or after PR3).
- **Full `lib/features/covenant_os/` directory deletion** from PlumbLineOS:
  this is a cleanup step that should happen 2–4 weeks after PR3 ships,
  once the tombstone transition period confirms no regressions.

---

## Related

- [CovenantOS MIGRATION_FROM_PLUMBLINEOS.md](../MIGRATION_FROM_PLUMBLINEOS.md)
- [Separation plan audit](https://github.com/boshields-blip/PlumbLineOS) (prior conversation context)
