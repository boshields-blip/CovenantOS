# Web Architecture

Status: Draft | Owner: @boshields-blip | Last updated: 2026-08-01

---

> **The Word was restructured on 2026-08-01.** The module is now six movements — The Land of the Text, The Language of the Land, Walking the Text, Knowing Your Own Way, The Streams of the Traditions, and Living the Covenant. The Diagnostic Engine and Berean Tool routes are retired. See `docs/WORD_REDESIGN.md` for the full rationale and map.


## Canonical role

This document is the canonical interactive web architecture for CovenantOS 2.0. It defines the build target, route ownership, page patterns, tool behaviors, and presentation rules that the build agent should treat as the complete source of truth before any application code is written. The exhaustive route-to-content mapping lives in [`docs/ROUTE_MATRIX.md`](./ROUTE_MATRIX.md).

---

## Technology stack decision

- **Framework:** SvelteKit
- **Deployment target:** `@sveltejs/adapter-static` with prerendered routes and static asset output
- **Styling:** Tailwind CSS
- **Markdown pipeline:** mdsvex for markdown-driven pages and module content ingestion
- **Hebrew rendering font:** Noto Serif Hebrew for Hebrew word cards and inline Hebrew tokens
- **Persistence:** browser `localStorage` only for reflection tools; no remote persistence

This stack preserves the markdown-first architecture already present in the repository, keeps the runtime fully static, and allows guided interactivity without introducing any external runtime dependency.

---

## Canonical site structure

The route inventory below is authoritative for the web build. Use it together with [`docs/ROUTE_MATRIX.md`](./ROUTE_MATRIX.md) when generating route manifests, content loaders, and navigation.

### Global

| URL Path | Source Content File | Route Type |
|---|---|---|
| `/` | `docs/INTRODUCTION.md` | page |

### The Word

| URL Path | Source Content File | Route Type |
|---|---|---|
| `/the-word` | `modules/01_the_word/README.md` | module-landing |
| `/the-word/introduction` | `modules/01_the_word/INTRODUCTION.md` | page |
| `/the-word/the-land-of-the-text/**` | `modules/01_the_word/01_the_land_of_the_text/*` | page subtree |
| `/the-word/the-language-of-the-land/**` | `modules/01_the_word/02_the_language_of_the_land/*` | page subtree |
| `/the-word/walking-the-text/**` | `modules/01_the_word/03_walking_the_text/*` | page subtree |
| `/the-word/knowing-your-own-way/**` | `modules/01_the_word/04_knowing_your_own_way/*` and `content/data/knowing_your_own_way.json` | page/tool subtree |
| `/the-word/the-streams-of-the-traditions/**` | `modules/01_the_word/05_the_streams_of_the_traditions/*` and `content/data/streams.json` | page/tool subtree |
| `/the-word/living-the-covenant/**` | `modules/01_the_word/06_living_the_covenant/*` | page subtree |

### The Household

| URL Path | Source Content File | Route Type |
|---|---|---|
| `/the-household` | `modules/02_the_household/README.md` | module-landing |
| `/the-household/oikonomia` | `modules/02_the_household/OIKONOMIA.md` | page |
| `/the-household/household-flow-model` | `modules/02_the_household/HOUSEHOLD_FLOW_MODEL.md` | tool |
| `/the-household/agrarian-rhythms` | `modules/02_the_household/AGRARIAN_RHYTHMS.md` | page |
| `/the-household/household-vs-consumer-economy` | `modules/02_the_household/HOUSEHOLD_VS_CONSUMER_ECONOMY.md` | page |
| `/the-household/land-and-inheritance` | `modules/02_the_household/LAND_AND_INHERITANCE.md` | page |
| `/the-household/hebraic-word-studies` | `modules/02_the_household/HEBRAIC_WORD_STUDIES.md` | page |

### The Compact

| URL Path | Source Content File | Route Type |
|---|---|---|
| `/the-compact` | `modules/03_the_compact/README.md` | module-landing |
| `/the-compact/covenant-vs-contract` | `modules/03_the_compact/COVENANT_VS_CONTRACT.md` | page |
| `/the-compact/a-call-to-freedom` | `modules/03_the_compact/A_CALL_TO_FREEDOM.md` | page |
| `/the-compact/subsidiarity` | `modules/03_the_compact/SUBSIDIARITY.md` | page |
| `/the-compact/commons-and-shared-life` | `modules/03_the_compact/COMMONS_AND_SHARED_LIFE.md` | page |
| `/the-compact/peoplehood` | `modules/03_the_compact/PEOPLEHOOD.md` | page |
| `/the-compact/local-market-and-social-fabric` | `modules/03_the_compact/LOCAL_MARKET_AND_SOCIAL_FABRIC.md` | page |
| `/the-compact/hebraic-word-studies` | `modules/03_the_compact/HEBRAIC_WORD_STUDIES.md` | page |
| `/the-compact/formation-questions` | `modules/03_the_compact/FORMATION_QUESTIONS.md` | tool |

---

## Homepage pattern — The Covenant Map

- The homepage at `/` is **The Covenant Map**: a visual entry point that introduces the full formation terrain.
- It uses **no navigation bar**. Entry happens through the map itself, a short orientation sentence, and slow reveal motion that invites walking rather than skimming.
- Its regions foreshadow the formation terrain before the user moves into the three primary modules.
- Each region reveal should fade in sequentially, with slight stagger and no abrupt movement, before the three module pathways become active entry points.

## Module landing page pattern

Every module landing page (`/the-word`, `/the-household`, `/the-compact`) follows the same pattern:

- **Scroll-based journey:** the landing page should read like a walk into the module rather than a dashboard.
- **Stepping-stone pathway:** a visible ordered sequence of the key pages in the recommended reading path.
- **Suggested entry points:** one highlighted first page, one reflective question, and one optional branch for returning users.
- **Context banner support:** `/the-household` and `/the-compact` must be able to show the direct-entry contextual banner defined below.

## Content page pattern

- **Reading width:** `720px` maximum text column width.
- **Supporting elements:** pull quotes, Hebrew word cards, comparison panels, side-drawer cross-references, and reflective prompts are standard page-level primitives.
- **Cross-reference behavior:** side drawers open inline related content from another module file without taking the user away from the current page.
- **Reflective posture:** prompts appear after major sections, never as interruptive pop-ups.

## Interactive element specifications

### A. Household Flow Diagram

- **Route:** `/the-household/household-flow-model`
- **Source:** `modules/02_the_household/HOUSEHOLD_FLOW_MODEL.md`
- **Form:** animated circular SVG showing the household flow cycle.
- **Interaction:** a consumer economy toggle switches the diagram between covenantal household flow and consumer economy inversion.
- **State:** the toggle state is client-side only and resets per session.

### B. Knowing Your Own Way

- **Route:** `/the-word/knowing-your-own-way/the-examination`
- **Source:** [`content/data/knowing_your_own_way.json`](../content/data/knowing_your_own_way.json)
- **Form:** a guided, local-only examination of the assumptions and cultural currents that shape the reader.
- **Interaction:** one reflection at a time, with device-only persistence and a clear-saved-reflections control.

### C. Streams Explorer

- **Route:** `/the-word/the-streams-of-the-traditions/explore`
- **Source:** [`content/data/streams.json`](../content/data/streams.json)
- **Form:** a static explorer of Christian traditions, their gifts, and their blind spots.
- **Interaction:** readers can explore each stream and optionally continue into the Knowing Your Own Way examination.

### D. Compact Builder

- **Route:** `/the-compact/formation-questions`
- **Source:** [`content/data/compact_builder.json`](../content/data/compact_builder.json)
- **Form:** localStorage-backed reflection tool organized into four sections from `modules/03_the_compact/FORMATION_QUESTIONS.md` (The Word, The Household, The Compact, and Implementation Practices).
- **Interaction:** users can move section by section, save reflection text locally, and trigger client-side print/export views using `export_label` and `print_title` metadata.
- **Copy rule:** the capstone question copy is authored in `modules/03_the_compact/FORMATION_QUESTIONS.md` and mirrored in `content/data/compact_builder.json` for the interactive tool; the two sources must stay in sync.

### E. Hebrew Word Cards

- **Routes:** embedded inside relevant content pages, especially `/the-word/the-language-of-the-land/hebrew-word-pictures`, `/the-household/hebraic-word-studies`, and `/the-compact/hebraic-word-studies`.
- **Form:** click-to-reveal three-stage cards.
- **Stages:** token -> transliteration/pronunciation -> covenantal meaning/application.
- **Interaction:** cards reveal slowly in place and collapse without page jumps.

## Visual design system

### Color palette

- Parchment — `#F5EDD6`
- Charcoal — `#2C2417`
- Ochre — `#8B6914`
- Slate — `#5A6B7A`
- Sage — `#6B7C5C`

### Typography

- **Body:** Lora or EB Garamond
- **Headings:** Playfair Display
- **Hebrew:** Noto Serif Hebrew

### Motion principles

- Slow fades over snaps
- Gentle staggered reveals over abrupt entrances
- No snapping transitions for panels, drawers, or section reveals

## Navigation strategy for Living the Covenant

- The main `/the-word` experience should not expose the full Living the Covenant subtree immediately.
- Use **progressive disclosure**: local sub-navigation appears only inside `/the-word/living-the-covenant/`.
- Inside that movement, expose local sub-navigation for `come-to-the-table`, `harvest-and-hymn`, and their child pages only.
- Do not surface the full subtree in a global header or on the homepage.

## Sequence enforcement policy

- CovenantOS uses **guided mode** as the recommended path: The Word -> The Household -> The Compact.
- Direct deep links to `/the-household` and `/the-compact` must display a dismissible contextual banner: **"You are entering Module 2/3 — The Word forms the foundation."**
- The banner is contextual, not a gate. Users may continue immediately after dismissal.

## localStorage policy

- Every tool page that stores reflection state must display: **"Your reflections are saved only on this device. Nothing is sent anywhere."**
- Every tool page must expose a **Clear saved reflections** control.
- No tool page may imply cloud sync, accounts, or remote recovery.

## Hebrew rendering spec

- Apply the **Noto Serif Hebrew** font to Hebrew word cards and inline Hebrew tokens.
- Every Hebrew token span uses `dir="rtl"`.
- Fallback font stack: `'Noto Serif Hebrew', 'SBL Hebrew', serif`.

## Side drawer scope

- Side drawers are **contextual cross-references only**.
- A drawer opens inline content from another module file while preserving the current reading context.
- Limit the interface to **two open drawers simultaneously**.
- Drawer state is local to the current page instance; **no global state**.

## Source data artifacts for interactive routes

- [`content/data/knowing_your_own_way.json`](../content/data/knowing_your_own_way.json) — canonical data pack for the Knowing Your Own Way examination
- [`content/data/streams.json`](../content/data/streams.json) — canonical data pack for the Streams Explorer
- [`content/data/compact_builder.json`](../content/data/compact_builder.json) — canonical data pack for the Compact Builder