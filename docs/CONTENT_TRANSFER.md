# Content Transfer

Status: Historical | Owner: @boshields-blip | Last updated: 2026-08-02

---

## Purpose

This document is the historical record of the CovenantOS 2.0 content transfer. The transfer is complete, the duplicate legacy content tree has been removed, and the current source of truth now lives in `modules/` plus `content/data/*.json`.

---

## Completion status

- All legacy CovenantOS formation content has been absorbed into CovenantOS 2.0.
- The duplicate legacy tree was removed on 2026-08-02 after all tracker items reached Complete.
- The Word no longer uses the old five-layer directory layout; it is now organized as six movements.

---

## Where the transferred material landed

| Legacy material | CovenantOS 2.0 destination | Notes |
|---|---|---|
| Foundational philosophy and first-principles framing | **The Word → The Land of the Text** and module introduction | Reframed around the world Scripture assumes rather than the former layer directory names. |
| Diagnostic and self-examination material | **The Word → Knowing Your Own Way** and `content/data/knowing_your_own_way.json` | Diagnostic content became a guided self-examination sequence and local-only reflection tool. |
| Berean and text-walking material | **The Word → Walking the Text** and related study pages | The route tree now emphasizes reading in context and walking the text rather than a separate tool namespace. |
| Language and Hebraic vocabulary material | **The Word → The Language of the Land** | Language work now lives inside the movement structure of The Word. |
| Tradition-weighing material | **The Word → The Streams of the Traditions** and `content/data/streams.json` | Tradition comparison is surfaced as both content pages and a static explorer. |
| Formation practices | **The Word → Living the Covenant** | Come to the Table, Harvest & Hymn, and the Re-formation Pathway remain intact inside the sixth movement. |

---

## Net-new module status

| Module | Status | Notes |
|---|---|---|
| The Household | Complete | Household stewardship, agrarian rhythms, inheritance, and household reflection pages are now part of the active static site. |
| The Compact | Complete | Covenantal public-life content and the Compact Builder reflection tool are now part of the active static site. |

---

## Active sources of truth

- `modules/01_the_word/01_the_land_of_the_text/` through `modules/01_the_word/06_living_the_covenant/`
- `modules/02_the_household/`
- `modules/03_the_compact/`
- `content/data/knowing_your_own_way.json`
- `content/data/streams.json`
- `content/data/compact_builder.json`
- `docs/WEB_ARCHITECTURE.md` and `docs/ROUTE_MATRIX.md`

---

## Historical note

If you need to understand the pre-2.0 migration story, use the documents in `archive/`. Do not recreate the retired five-layer directory tree or restore the removed Flutter/Supabase implementation artifacts.
