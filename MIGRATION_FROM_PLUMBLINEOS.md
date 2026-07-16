# Migration from PlumbLineOS

**Status:** Transitional | **Owner:** @boshields-blip | **Last updated:** 2026-07-15

---

## Overview

CovenantOS was separated from `boshields-blip/PlumbLineOS`, where a `covenant_os/` directory originally lived at the repository root. This document is the migration ledger: it records what moved, what remains in transition, and what handoff work still belongs to PlumbLineOS.

**Authority note:** This document is transitional. For steady-state ownership and runtime boundaries, use [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) and [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](docs/INTEGRATION_WITH_COMMUNITY_OS.md).

---

## What is now owned by CovenantOS

| Capability | Location | Status |
|---|---|---|
| App config / env var abstraction | `lib/core/config/app_config.dart` | ✅ Done |
| Supabase service wrapper | `lib/core/services/supabase_service.dart` | ✅ Done |
| `os.covenant` entitlement guard | `lib/core/services/entitlement_service.dart` | ✅ Done |
| Invite acceptance (redeem lane invite) | `lib/features/covenant_onboarding/` | ✅ Done |
| Post-acceptance onboarding screen | `lib/features/covenant_onboarding/` | ✅ Done |
| Formation groups model + repository | `lib/features/formation_layer/` | ✅ Done |
| Formation records model + repository | `lib/features/formation_layer/` | ✅ Done |
| Come to the Table screen | `lib/features/formation_layer/` | ✅ Done |
| Harvest and Hymn screen | `lib/features/formation_layer/` | ✅ Done |
| Formation home screen | `lib/features/formation_layer/` | ✅ Done |
| Berean Tool home screen (stub) | `lib/features/berean_tool/` | ✅ Stub |
| GoRouter route wiring | `lib/app/routes/covenant_routes.dart` | ✅ Done |
| Supabase migrations (4 tables) | `supabase/migrations/` | ✅ Done |
| PlumbLineOS PR3 cutover guide | `docs/PR3_PLUMBLINEOS_CUTOVER.md` | ✅ Documented |

---

## Migration map

| Source in PlumbLineOS | Destination in CovenantOS | Mode |
|---|---|---|
| `covenant_os/` (root tree, all 5 layers) | `covenant_os/` (preserve 5-layer structure) | move (Phase 3+) |
| `covenant_os/ARCHITECTURE.md` | `docs/ARCHITECTURE.md` | move + merge (done in Phase 1) |
| `covenant_os/INTRODUCTION.md` | `docs/INTRODUCTION.md` | move + merge (done in Phase 1) |
| `lib/features/covenant_os/` | distribute into `lib/features/` | move + reorganize (Slice A started) |
| Any covenant routes in `lib/app/routes/homestead_routes.dart` | `lib/app/routes/covenant_routes.dart` | move (Slice A done; PlumbLineOS tombstone in PR3) |
| Forum / formation group screens | matching feature dirs | move (Slice B+) |
| Supabase migrations matching `*covenant*`, `*formation*`, `*berean*` | `supabase/migrations/` | Slice A migrations added; full move in Slice B+ |

---

## Phase boundaries

### Phase 1 — Scaffold (complete)
- Created the CovenantOS repository structure with fresh placeholder content
- Did **not** touch PlumbLineOS
- Established the 5-layer `covenant_os/` tree, Flutter app skeleton, docs, and CI

### Phase 2 — Slice A: formation runtime (complete)
- Core infrastructure: Supabase service, config, entitlement service
- Covenant formation vertical: formation groups, session records, Come to the Table, Harvest and Hymn
- Onboarding/invite acceptance flow
- Berean Tool stub entry screen
- GoRouter route wiring with entitlement guard
- Supabase migrations for Slice A tables
- PlumbLineOS PR3 cutover documentation

### Phase 3 — PlumbLineOS tombstone (planned in PlumbLineOS)
- Tombstone /covenant/** routes in TradeCore
- Remove covenant startup coupling from TradeCore main.dart
- Remove WeeklyFormationSummaryCard import from Weekly Ops
- Remove covenant lane from invite-user edge function
- See `docs/PR3_PLUMBLINEOS_CUTOVER.md` for the full checklist

### Phase 4 — Slice B: Berean Tool + Language Module (future)
- Full BereanSession model, repository, and session screens
- Language Module glossary and term management
- Covenant Forum screens
- Additional Supabase migrations

### Phase 5 — PlumbLineOS cleanup (future)
- Delete `lib/features/covenant_os/` from PlumbLineOS after tombstone window
- Delete `covenant_os/` root tree from PlumbLineOS after tombstone window

---

## What does NOT move here

| Work | Destination |
|------|-------------|
| Homestead OS, Market OS, Wholesale OS | `boshields-blip/CommunityOS` |
| Commercial plumbing/HVAC (TradeCore) | Stays in `boshields-blip/PlumbLineOS` |
| MeshCore app layer | `boshields-blip/CommunityOS` |
| LocationOS / GPS (fleet context) | Stays in `boshields-blip/PlumbLineOS` |
| LocationOS / GPS (farm/trail context) | `boshields-blip/CommunityOS` |

CovenantOS is purely formational and philosophical. Nothing operational, commercial, or homestead-operational belongs here.

---

## Related repositories

- `boshields-blip/PlumbLineOS` — source repository for migrated covenant content and owner of the remaining tombstone work
- `boshields-blip/CommunityOS` — optional consumer of CovenantOS via the `frameOverride` hook
