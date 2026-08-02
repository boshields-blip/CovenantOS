# Introduction to CovenantOS

**Status:** Draft | **Owner:** @boshields-blip | **Last updated:** 2026-08-02

---

## What is CovenantOS?

CovenantOS is a static, interactive web experience for covenantal formation. It is designed as a guided interpretive space that helps people re-see life through a Hebraic frame: scripture, household, land, stewardship, and public life held together in covenant rather than split apart into isolated topics.

The target architecture is deliberately simple. There is no backend, no account system, no forum, no membership model, and no intended Supabase runtime in CovenantOS 2.0.

---

## The three modules

1. **The Word** — the Hebraic thought environment organized into six movements
2. **The Household** — oikonomia, household stewardship, agrarian rhythms, and relational economics
3. **The Compact** — political anthropology, covenantal order, subsidiarity, commons, and peoplehood

```text
The Word → forms imagination
    ↓
The Household → households form communities
    ↓
The Compact
```

---

## How to read the repository right now

- `modules/` expresses the content source of truth for CovenantOS 2.0
- `content/data/` contains the structured data packs used by local-only reflection tools
- `src/` contains the SvelteKit routes, layouts, and shared components
- `docs/WEB_ARCHITECTURE.md` explains the canonical interactive architecture
- `docs/DESIGN_PRINCIPLES.md` explains the design language behind the experience
- `docs/CONTENT_TRANSFER.md` records the completed content transfer and removal of the retired legacy tree
- `archive/` holds historical migration and audit material that no longer defines the active architecture

---

## What CovenantOS is not

CovenantOS is not operational software for trades, homestead logistics, commerce, or backend-managed community features. Its purpose is formational, interpretive, and relational.
