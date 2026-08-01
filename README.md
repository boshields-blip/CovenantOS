# CovenantOS

> **A static, interactive web experience for covenantal formation** — no backend, no accounts, no forum, no membership.

**Status:** Draft | **Owner:** @boshields-blip | **Shape:** Markdown-first content · Interactive web-first architecture · Static delivery

---

## CovenantOS 2.0

CovenantOS is being reshaped into a guided covenantal atlas: a static, interactive web experience that helps people re-see life through a Hebraic frame. It is embodied, relational, land-aware, and household-centered. The experience is designed to form imagination first, then household life, then public life.

There is no backend in the target architecture. There are no accounts, no memberships, no forum surfaces, and no Supabase-dependent runtime in the intended CovenantOS 2.0 experience. CovenantOS explains the why of covenantal life; CommunityOS handles the operational how of shared spaces, markets, and participation.

---

## The three modules

| Module | Purpose | Tone |
|---|---|---|
| **The Word** | Hebraic thought environment built from the existing 5-layer CovenantOS philosophy | Scripture is a land, not a library. You walk in it. |
| **The Household** | Oikonomia — household stewardship, agrarian rhythms, and relational economics | Economics is relational, not transactional. The household is the first school. |
| **The Compact** | Political anthropology, covenantal order, subsidiarity, and commons | Political life is relational, not institutional. The compact flows from the household. |

```text
The Word → forms imagination
    ↓
The Household → households form communities
    ↓
The Compact
```

---

## Design posture

- **Hebraic in root** — walking over abstract thinking, practices over abstractions, household over isolated individualism, land over placeless digitalism, covenant over contract
- **Static and interactive** — content is delivered without accounts or server-side state, but the experience still guides, reveals, compares, and invites reflection
- **Content-first** — markdown and structured content drive the product; interface serves the content rather than competing with it
- **Module-sequenced** — The Word forms the imagination that makes household stewardship possible; households then form the conditions for covenantal public life

---

## Repository documents

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) — three-module target architecture
- [`docs/DESIGN_PRINCIPLES.md`](docs/DESIGN_PRINCIPLES.md) — design language and product posture
- [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](docs/INTEGRATION_WITH_COMMUNITY_OS.md) — boundary between CovenantOS formation and CommunityOS operations
- [`docs/CONTENT_TRANSFER.md`](docs/CONTENT_TRANSFER.md) — canonical content transfer tracker
- [`MIGRATION_FROM_PLUMBLINEOS.md`](MIGRATION_FROM_PLUMBLINEOS.md) — transfer plan and status ledger
- [`archive/README.md`](archive/README.md) — legacy Flutter/Supabase architecture documents kept for reference only

---

## Repository structure

```text
CovenantOS/
├── modules/
│   ├── 01_the_word/
│   ├── 02_the_household/
│   └── 03_the_compact/
├── covenant_os/              # existing 5-layer content retained until transfer is complete
├── docs/                     # active architecture, principles, and transfer docs
├── archive/                  # historical Flutter/Supabase docs retained for reference
├── lib/                      # legacy Flutter code retained during transition; not the target architecture
├── supabase/                 # legacy migration history retained during transition; not part of CovenantOS 2.0
└── web/
```

---

## Transition note

This repository still contains the legacy `covenant_os/` content tree, Flutter code under `lib/`, and Supabase migration history under `supabase/`. Those assets remain in place until content transfer and later cleanup are complete, but they are no longer the target architecture described by the active documentation.

---

## License

Apache 2.0 — see [`LICENSE`](LICENSE).

## Development

CovenantOS 2.0 is a static SvelteKit web application.

### Prerequisites
- Node.js 18+

### Install
```bash
npm install
```

### Dev server
```bash
npm run dev
```

### Build
```bash
npm run build
```

The build output lands in `build/`. Deploy to any static host (Netlify, GitHub Pages, Vercel static).

See `docs/WEB_ARCHITECTURE.md` for the full architecture specification.
