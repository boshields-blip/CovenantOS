# Content Transfer Plan from PlumbLineOS

**Status:** Draft | **Owner:** @boshields-blip | **Last updated:** 2026-07-31

---

## Purpose

This document replaces the earlier runtime migration ledger with a content transfer plan for CovenantOS 2.0. The goal is to move the philosophical and study content that originated in PlumbLineOS into the new module architecture while explicitly leaving behind backend, forum, membership, and legacy Flutter runtime concerns.

---

## Transfer rules

1. **All existing 5-layer content transfers into The Word.**
2. **The Household and The Compact are net-new modules.**
3. **No Supabase schemas, Flutter feature code, forum code, membership flows, onboarding flows, or formation-group runtime transfers into the target architecture.**
4. **The existing `covenant_os/` tree remains in place until content transfer is complete.**

---

## What transfers into `modules/01_the_word/`

| Legacy content piece | Current location in CovenantOS | Target location in CovenantOS 2.0 | Status | Notes |
|---|---|---|---|---|
| Foundational Layer overview and first principles | `covenant_os/01_foundational_layer/` | `modules/01_the_word/01_foundational_layer/` | Planned | Preserves the bedrock philosophical frame |
| Diagnostic Engine categories and philosophy modules | `covenant_os/02_diagnostic_engine/` | `modules/01_the_word/02_diagnostic_engine/` | Planned | Includes seven categories and rival-philosophy diagnostics |
| Berean Tool guides, profiles, and schemas | `covenant_os/03_berean_tool/` | `modules/01_the_word/03_berean_tool/` | Planned | Keeps scripture/text examination under The Word |
| Language Module studies and dictionaries | `covenant_os/04_language_module/` | `modules/01_the_word/04_language_module/` | Planned | Carries forward Hebraic language and imagination work |
| Formation Layer practices and subcontent | `covenant_os/05_formation_layer/` | `modules/01_the_word/05_formation_layer/` | Planned | Includes Come to the Table and Harvest and Hymn |

---

## Net-new module work

| Module | Status | Scope |
|---|---|---|
| `modules/02_the_household/` | Planned | Oikonomia, household flow, agrarian rhythms, household economy vs. consumer economy, land and place |
| `modules/03_the_compact/` | Planned | Covenant vs. contract, subsidiarity, commons, local market life, peoplehood vs. consumer identity |

---

## What does **not** transfer

| Legacy asset type | Reason it does not transfer |
|---|---|
| Supabase migrations and schema files | CovenantOS 2.0 has no backend target architecture |
| Forum runtime code and discussion models | There is no forum in the new product |
| Membership, onboarding, invites, and account flows | There are no accounts or memberships in the target experience |
| Flutter feature code under `lib/` | Legacy implementation is retained only until later cleanup |
| Formation-group schemas and runtime records | Group persistence is not part of the static interactive target |

---

## Status tracker

| Work item | Status | Notes |
|---|---|---|
| Rewrite repository architecture docs around three modules | Done | `README.md`, `docs/ARCHITECTURE.md`, and design docs now describe CovenantOS 2.0 |
| Scaffold `modules/01_the_word/` and its five sublayers | Done | Placeholder READMEs created for each layer |
| Scaffold `modules/02_the_household/` | Done | Placeholder README created for net-new content |
| Scaffold `modules/03_the_compact/` | Done | Placeholder README created for net-new content |
| Build canonical transfer tracker | Done | See `docs/CONTENT_TRANSFER.md` |
| Transfer Foundational Layer content | Planned | Existing content remains in `covenant_os/` until moved |
| Transfer Diagnostic Engine content | Planned | Existing content remains in `covenant_os/` until moved |
| Transfer Berean Tool content | Planned | Existing content remains in `covenant_os/` until moved |
| Transfer Language Module content | Planned | Existing content remains in `covenant_os/` until moved |
| Transfer Formation Layer content | Planned | Existing content remains in `covenant_os/` until moved |
| Author The Household content | Planned | Entire module is net-new |
| Author The Compact content | Planned | Entire module is net-new |

---

## Canonical tracking note

Use [`docs/CONTENT_TRANSFER.md`](docs/CONTENT_TRANSFER.md) as the canonical file-level transfer tracker. This document is the higher-level plan and status ledger for the move away from the PlumbLineOS-era architecture.
