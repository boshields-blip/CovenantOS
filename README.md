# CovenantOS

> **A 5-layer philosophical formation tool** — not operational software for trades or commerce.

**Status:** Active  
**Owner:** @boshields-blip  
**Stack:** Flutter / Dart · Markdown content layers · Supabase

---

## What is CovenantOS?

CovenantOS is a formational and philosophical tool designed to help individuals and communities examine beliefs, identify contradictions, engage scripture, and grow in covenantal language and practice. It is emphatically **not** a trade management system, a homestead inventory tracker, or a market platform — those concerns belong to [PlumbLineOS](https://github.com/boshields-blip/PlumbLineOS) and [CommunityOS](https://github.com/boshields-blip/CommunityOS) respectively.

---

## Intended users

- Individuals working through belief formation and spiritual diagnostics
- Communities using covenantal language and liturgical practices
- Facilitators of the "Come to the Table" and "Harvest and Hymn" formation practices
- Homestead Academy participants (via an optional `frameOverride` hook — see below)

---

## The 5 layers

| # | Layer | Purpose |
|---|-------|---------|
| 1 | **Foundational Layer** | First principles and frame — the bedrock assumptions that orient all other layers |
| 2 | **Diagnostic Engine** | Surfaces beliefs, contradictions, and patterns in an individual's or group's formation |
| 3 | **Berean Tool** | Scripture and text examination tool — structured engagement with primary sources |
| 4 | **Language Module** | Terminology and formation language — building a shared covenantal vocabulary |
| 5 | **Formation Layer** | Embodied practices including "Come to the Table" and "Harvest and Hymn" |

Lower layers do not reference higher layers. Layer 1 content does not depend on Layer 5 implementations. Downward references are fine; upward references are not allowed. See [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for full details.

---

## Relationship to CommunityOS (`frameOverride`)

CovenantOS is its own product with its own users and its own release cadence. However, it may be **optionally surfaced inside CommunityOS** via a `frameOverride` hook on Homestead Academy tracks.

The relationship is **one-way**:

- CommunityOS optionally consumes CovenantOS (e.g., a Covenant-flavored intro card replaces the default Academy intro).
- CovenantOS does **not** depend on CommunityOS and has no knowledge of homestead, market, or wholesale operations.

See [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](docs/INTEGRATION_WITH_COMMUNITY_OS.md) for full integration details.

---

## Related repositories

| Repo | Purpose |
|------|---------|
| [boshields-blip/CommunityOS](https://github.com/boshields-blip/CommunityOS) | Homestead OS, Market OS, Wholesale OS, MeshCore, LocationOS |
| [boshields-blip/PlumbLineOS](https://github.com/boshields-blip/PlumbLineOS) | TradeCore — commercial plumbing/HVAC OS |

CovenantOS content is being separated from PlumbLineOS. See [`MIGRATION_FROM_PLUMBLINEOS.md`](MIGRATION_FROM_PLUMBLINEOS.md) for the migration plan.

---

## Getting started

```bash
flutter pub get
flutter analyze
flutter test
```

---

## Repository structure

```
CovenantOS/
├── covenant_os/                # 5-layer formational content (markdown-first)
│   ├── 01_foundational_layer/
│   ├── 02_diagnostic_engine/
│   ├── 03_berean_tool/
│   ├── 04_language_module/
│   └── 05_formation_layer/
│       ├── come_to_the_table/
│       └── harvest_and_hymn/
├── lib/                        # Flutter app (feature-first)
│   ├── main.dart
│   ├── app/
│   └── features/
│       ├── berean_tool/
│       ├── language_module/
│       ├── formation_layer/
│       └── covenant_forum/
├── docs/                       # Architecture and integration docs
├── supabase/                   # Migrations (upcoming)
└── test/
```

---

## License

Apache 2.0 — see [`LICENSE`](LICENSE).
