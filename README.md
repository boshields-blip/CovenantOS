# CovenantOS

> **A static, interactive web experience for covenantal formation** — no backend, no accounts, no forum, no membership.

**Status:** Draft | **Owner:** @boshields-blip | **Shape:** Markdown-first content · Interactive web-first architecture · Static delivery

---

## CovenantOS 2.0

CovenantOS is a guided covenantal atlas: a static, interactive web experience that helps people re-see life through a Hebraic frame. It is embodied, relational, land-aware, and household-centered. The experience is designed to form imagination first, then household life, then public life.

There is no backend in the target architecture. There are no accounts, no memberships, no forum surfaces, and no Supabase-dependent runtime in CovenantOS 2.0. CovenantOS explains the why of covenantal life; CommunityOS handles the operational how of shared spaces, markets, and participation.

---

## The three modules

| Module | Purpose | Tone |
|---|---|---|
| **The Word** | Hebraic thought environment organized as six movements | Scripture is a land, not a library. You walk in it. |
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

## Repository documents

- [`docs/WEB_ARCHITECTURE.md`](docs/WEB_ARCHITECTURE.md) — canonical CovenantOS 2.0 web architecture
- [`docs/ROUTE_MATRIX.md`](docs/ROUTE_MATRIX.md) — route-to-content inventory for the static site
- [`docs/DESIGN_PRINCIPLES.md`](docs/DESIGN_PRINCIPLES.md) — design language and product posture
- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) — module boundaries and repository surfaces
- [`docs/CONTENT_TRANSFER.md`](docs/CONTENT_TRANSFER.md) — historical transfer record for the retired legacy tree
- [`archive/README.md`](archive/README.md) — archived Flutter/Supabase-era planning and migration documents

---

## Repository structure

```text
CovenantOS/
├── archive/                  # historical migration, audit, and Supabase reference docs
├── content/
│   └── data/                 # structured JSON data for interactive reflection tools
├── docs/                     # active architecture, design, and route docs
├── modules/                  # markdown source of truth for module content
│   ├── 01_the_word/
│   ├── 02_the_household/
│   └── 03_the_compact/
├── src/                      # SvelteKit routes, layouts, and UI components
├── static/                   # static images and public assets
├── package.json
├── svelte.config.js
└── netlify.toml
```

---

## Transition note

Legacy Flutter, Supabase, and duplicate content artifacts were removed after the CovenantOS 2.0 transfer completed on 2026-08-02. Historical planning and migration documents worth keeping now live under [`archive/`](archive/).

---

## License

Apache 2.0 — see [`LICENSE`](LICENSE).

## Development

CovenantOS 2.0 is a static SvelteKit web application.

### Prerequisites
- Node.js 20+

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

The build output lands in `build/`. GitHub Pages deploys with `BASE_PATH=/CovenantOS`; Netlify builds without that override.
