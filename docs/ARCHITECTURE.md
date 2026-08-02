# Architecture

**Status:** Draft | **Owner:** @boshields-blip | **Last updated:** 2026-08-02

---

## Overview

CovenantOS 2.0 is a static, interactive web experience organized around three modules: **The Word**, **The Household**, and **The Compact**. The system is content-first and formative in intent: it is meant to reshape imagination, stewardship, and public life through a guided encounter rather than through dashboards, feeds, accounts, or backend-managed communities.

The target architecture has no backend, no accounts, no forum, no memberships, no transactional logic, and no Supabase runtime dependency. Historical migration and audit material is preserved only under `archive/`.

---

## Module structure

### Module 1 — The Word

The Word is the Hebraic thinking environment for CovenantOS. It absorbs the earlier philosophy and study material into six movements: The Land of the Text, The Language of the Land, Walking the Text, Knowing Your Own Way, The Streams of the Traditions, and Living the Covenant. Its purpose is not merely to help someone study scripture as information, but to help them walk through scripture as a land that forms perception, language, and practice.

Primary content in this module includes:
- Foundational covenantal philosophy and first principles
- Diagnostic frames for rival philosophies and contradictions
- Berean examination tools for teachers, traditions, and self
- Hebraic word studies and language formation
- Embodied practices such as Come to the Table and Harvest and Hymn

**Tone:** Scripture is a land, not a library. You walk in it.

---

### Module 2 — The Household

The Household is the oikonomia module: household stewardship as the center of life. It reframes economics away from abstract transactions and back toward the relational life of work, craft, land, hospitality, trade, and community.

Primary content in this module includes:
- Household flow models (work → craft → garden → hospitality → trade → community)
- Oikonomia word study and household economy framing
- Household economy vs. consumer economy contrasts
- Agrarian rhythms, seasons, soil, cycles, inheritance, and place
- Guided reflection on stewardship inside actual households and neighborhoods

**Tone:** Economics is relational, not transactional. The household is the first school.

---

### Module 3 — The Compact

The Compact is the political anthropology module. It helps users understand how people organize themselves covenantally: through subsidiarity, shared stewardship, commons, local market life, and peoplehood. This module grows from the imagination formed in The Word and the household patterns formed in The Household.

Primary content in this module includes:
- Covenant vs. contract distinctions
- Subsidiarity across local, regional, and civil layers
- Commons and shared stewardship
- Local market and social-fabric reflection
- Peoplehood vs. consumer identity

**Tone:** Political life is relational, not institutional. The compact flows from the household.

---

## Module dependency diagram

```text
The Word
    ↓ forms imagination
The Household
    ↓ households form communities
The Compact
```

**Rule:** The sequence is deliberate. CovenantOS does not begin with institutional life or abstract politics. Imagination is formed by The Word, that imagination is embodied in The Household, and only then does The Compact emerge with coherence.

---

## Design principles

- **Hebraic cognition** — walking over detached analysis; practices over abstractions; household over atomized individualism; land over placelessness; covenant over contract
- **No-backend architecture** — the system depends on no accounts, forum, membership, or server-managed application state
- **Interactive web-first** — the experience is guided and participatory, but the interaction serves reflection rather than feeds, alerts, or social features
- **Static content-first** — markdown and structured content are the primary source material; interface is secondary and interpretive

See [`docs/DESIGN_PRINCIPLES.md`](DESIGN_PRINCIPLES.md) for the fuller rationale.

---

## Relationship to CommunityOS

CovenantOS explains the why of covenantal household life, honest trade, and shared commons. CommunityOS handles the how of participation in shared spaces and local commerce.

CovenantOS may name Aletheia Farm and The Commons as lived examples inside its content, but market calendars, vendor sign-up, venue booking, accounts, and operational logistics belong in CommunityOS rather than in this repository. If CommunityOS chooses to surface CovenantOS framing through a one-way `frameOverride` hook, CovenantOS still remains a standalone product with no reverse dependency.

---

## Active repository surfaces

The active CovenantOS 2.0 architecture is expressed primarily through:

- `modules/` — markdown source of truth for module content
- `content/data/` — structured content packs for interactive reflection tools
- `src/routes/` — SvelteKit route surfaces and module entry points
- `src/lib/` — shared UI primitives for the static site
- `static/` — public images and site assets
- `docs/WEB_ARCHITECTURE.md` — canonical web architecture document
- `docs/ROUTE_MATRIX.md` — canonical route/content mapping
- `docs/DESIGN_PRINCIPLES.md` — design-language and sequencing rationale
- `docs/CONTENT_TRANSFER.md` — historical record of the completed transfer
- `archive/` — historical migration and audit documents preserved for reference only
