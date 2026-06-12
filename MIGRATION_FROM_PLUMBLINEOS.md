# Migration from PlumbLineOS

**Status:** Draft  
**Owner:** @boshields-blip  
**Last updated:** 2026-06-12

---

## Overview

CovenantOS is being separated from `boshields-blip/PlumbLineOS`, where a `covenant_os/` directory currently lives at the repository root. This document describes the planned migration — what moves, where it goes, and what remains behind.

**Phase 1 (this PR)** creates the CovenantOS scaffold with fresh placeholder content. **No content is moved from PlumbLineOS in this phase.** Phase 2 will execute the actual moves and merges described below.

---

## Migration map

| Source in PlumbLineOS | Destination in CovenantOS | Mode |
|---|---|---|
| `covenant_os/` (root tree, all 5 layers) | `covenant_os/` (preserve 5-layer structure) | move |
| `covenant_os/ARCHITECTURE.md` | `docs/ARCHITECTURE.md` (already promoted in this scaffold) | move + merge |
| `covenant_os/INTRODUCTION.md` | `docs/INTRODUCTION.md` (already promoted in this scaffold) | move + merge |
| `covenant_os/README.md` | `covenant_os/README.md` | move |
| `lib/features/covenant_os/` | distribute into `lib/features/{berean_tool,language_module,formation_layer,covenant_forum}/` | move + reorganize |
| Any covenant routes in `lib/app/routes/homestead_routes.dart` | `lib/app/routes/` | move |
| Forum / formation group screens | matching feature dirs | move |
| Supabase migrations matching `*covenant*`, `*formation*`, `*berean*` | `supabase/migrations/` | move |

---

## Phase boundaries

### Phase 1 — This PR (scaffold only)
- Creates the CovenantOS repository structure with fresh placeholder content
- Does **not** touch PlumbLineOS
- Establishes the 5-layer `covenant_os/` tree, Flutter app skeleton, docs, and CI

### Phase 2 — Content migration (future PR)
- Moves the `covenant_os/` tree from PlumbLineOS to CovenantOS
- Merges existing `ARCHITECTURE.md` and `INTRODUCTION.md` content into the promoted `docs/` versions
- Distributes `lib/features/covenant_os/` into the feature-first structure
- Moves relevant Supabase migrations
- Tombstones the covenant content in PlumbLineOS (adds deprecation notices pointing here)

### Phase 3 — PlumbLineOS tombstone (later phase)
- PlumbLineOS covenant directories are **tombstoned, not deleted**, in a controlled phase
- A tombstone adds a notice pointing to CovenantOS and prevents future writes to the legacy path
- The tombstone phase is planned but not scheduled — do not delete anything from PlumbLineOS until explicitly authorized

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

- `boshields-blip/PlumbLineOS` — source of the covenant content being migrated
- `boshields-blip/CommunityOS` — optional consumer of CovenantOS via the `frameOverride` hook
