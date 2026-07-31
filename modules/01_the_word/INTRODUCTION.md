# Introduction to The Word

**Status:** Draft | **Owner:** @boshields-blip | **Last updated:** 2026-07-31

---

## What is The Word?

The Word is a static, interactive web experience for covenantal formation. It is designed as a guided interpretive space that helps people re-see life through a Hebraic frame: scripture, household, land, stewardship, and public life held together in covenant rather than split apart into isolated topics.

This module belongs to a deliberately simple architecture. There is no backend, no account system, no forum, no membership model, and no intended Supabase runtime.

---

## The three modules

1. **The Word** — the Hebraic thought environment; absorbs the existing five-pathway philosophy and study tools
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

- `modules/` expresses the target three-module architecture
- `docs/ARCHITECTURE.md` explains the active three-module structure
- `docs/DESIGN_PRINCIPLES.md` explains the design language behind the redesign
- `docs/CONTENT_TRANSFER.md` tracks how legacy content moves into The Word and what must be authored for the other modules
- legacy source content, `lib/`, and `supabase/` remain elsewhere in the repository as transition-era assets until later cleanup

---

## What this module is not

The Word is not operational software for trades, homestead logistics, commerce, or backend-managed community features. Its purpose is formational, interpretive, and relational.
