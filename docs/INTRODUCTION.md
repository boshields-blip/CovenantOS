# Introduction to CovenantOS

**Status:** Draft | **Owner:** @boshields-blip | **Last updated:** 2026-07-31

---

## What is CovenantOS?

CovenantOS is a static, interactive web experience for covenantal formation. It is designed as a guided interpretive space that helps people re-see life through a Hebraic frame: scripture, household, land, stewardship, and public life held together in covenant rather than split apart into isolated topics.

The target architecture is deliberately simple. There is no backend, no account system, no forum, no membership model, and no intended Supabase runtime in CovenantOS 2.0.

---

## The three modules

1. **The Word** — the Hebraic thought environment; absorbs the existing 5-layer CovenantOS philosophy and study tools
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

- `modules/` expresses the target CovenantOS 2.0 architecture
- `docs/ARCHITECTURE.md` explains the active three-module structure
- `docs/DESIGN_PRINCIPLES.md` explains the design language behind the redesign
- `docs/CONTENT_TRANSFER.md` tracks how legacy content moves into The Word and what must be authored for the other modules
- `covenant_os/`, `lib/`, and `supabase/` remain in place as transition-era assets until later cleanup

---

## What CovenantOS is not

CovenantOS is not operational software for trades, homestead logistics, commerce, or backend-managed community features. Its purpose is formational, interpretive, and relational.
