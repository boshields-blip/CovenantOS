# CovenantOS

> **A 5-layer philosophical formation tool** — not operational software for trades, homesteads, markets, or commerce.

**Status:** Active  
**Owner:** @boshields-blip  
**Stack:** Flutter / Dart · Markdown content layers · Supabase

---

## What is CovenantOS?

CovenantOS is a formational and philosophical tool designed to help individuals and communities examine beliefs, identify contradictions, engage scripture, and grow in covenantal language and practice. It is emphatically **not** a trade management system, a homestead inventory tracker, or a market platform — those concerns belong to PlumbLineOS and CommunityOS.

---

## Intended users

- Individuals working through belief formation and spiritual diagnostics
- Communities using covenantal language and liturgical practices
- Facilitators of the "Come to the Table" and "Harvest and Hymn" formation practices
- Homestead Academy participants who opt into an optional CovenantOS frame inside CommunityOS

---

## Canonical architecture documents

Use these documents as the source of truth for repository ownership and boundaries:

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) — canonical architecture, ownership boundaries, and handoff behavior
- [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](docs/INTEGRATION_WITH_COMMUNITY_OS.md) — canonical CommunityOS integration contract
- [`docs/SUPABASE.md`](docs/SUPABASE.md) — canonical data and shared-project boundary rules
- [`MIGRATION_FROM_PLUMBLINEOS.md`](MIGRATION_FROM_PLUMBLINEOS.md) — transitional migration ledger
- [`docs/PR3_PLUMBLINEOS_CUTOVER.md`](docs/PR3_PLUMBLINEOS_CUTOVER.md) — transitional PlumbLineOS tombstone and redirect checklist

If an orientation document conflicts with the architecture docs above, the architecture docs win.

---

## The 5 layers

| # | Layer | Purpose |
|---|-------|---------|
| 1 | **Foundational Layer** | First principles and frame — the bedrock assumptions that orient all other layers |
| 2 | **Diagnostic Engine** | Surfaces beliefs, contradictions, and patterns in an individual's or group's formation |
| 3 | **Berean Tool** | Scripture and text examination tool — structured engagement with primary sources |
| 4 | **Language Module** | Terminology and formation language — building a shared covenantal vocabulary |
| 5 | **Formation Layer** | Embodied practices including "Come to the Table" and "Harvest and Hymn" |

Lower layers do not reference higher layers. Layer 1 content does not depend on Layer 5 implementations. Downward references are fine; upward references are not allowed. See [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for the full dependency and ownership model.

---

## Repository boundaries

### CovenantOS owns

- The 5-layer content tree under `covenant_os/`
- Flutter presentation and workflow code under `lib/` for CovenantOS users
- Covenant formation runtime, onboarding, forum, and formation records
- Covenant-specific Supabase tables, policies, and migrations

### CovenantOS does not own

- TradeCore / commercial plumbing and HVAC operations — PlumbLineOS
- Homestead, market, wholesale, MeshCore, and non-covenant Academy operations — CommunityOS
- CommunityOS Academy schemas or runtime logic
- PlumbLineOS tombstone routes beyond the redirect contract documented here

---

## Relationship to CommunityOS (`frameOverride`)

CovenantOS is its own product with its own users and release cadence. CommunityOS may optionally consume CovenantOS formation framing through a `frameOverride` hook on Homestead Academy tracks.

The relationship is **one-way**:

- CommunityOS is the consumer of an optional CovenantOS-owned presentation contract.
- CovenantOS does **not** import from or depend on CommunityOS internals.
- If the override is unavailable, disabled, or fails validation, CommunityOS falls back to its default Academy intro card.

See [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](docs/INTEGRATION_WITH_COMMUNITY_OS.md) for the full contract.

---

## Related repositories

| Repo | Purpose |
|------|---------|
| `boshields-blip/CommunityOS` | Homestead OS, Market OS, Wholesale OS, MeshCore, and optional consumption of CovenantOS framing |
| `boshields-blip/PlumbLineOS` | TradeCore — commercial plumbing/HVAC OS and the source repository for migrated covenant content |

---

## Getting started

```bash
flutter pub get
flutter analyze
flutter test
```

---

## Repository structure

```text
CovenantOS/
├── covenant_os/                # 5-layer formational content (markdown-first)
│   ├── 01_foundational_layer/
│   ├── 02_diagnostic_engine/
│   ├── 03_berean_tool/
│   ├── 04_language_module/
│   └── 05_formation_layer/
├── docs/                       # Canonical architecture, integration, and migration docs
├── lib/                        # Flutter app (feature-first)
│   ├── app/
│   ├── core/
│   └── features/
│       ├── berean_tool/
│       ├── covenant_forum/
│       ├── covenant_onboarding/
│       ├── formation_layer/
│       └── language_module/
├── supabase/
│   ├── migrations/
│   └── README.md
└── test/
```

---

## License

Apache 2.0 — see [`LICENSE`](LICENSE).
