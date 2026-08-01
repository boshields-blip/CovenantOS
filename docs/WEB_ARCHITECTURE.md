# Web Architecture

Status: Draft | Owner: @boshields-blip | Last updated: 2026-07-31

---

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
| `/the-word/foundational-layer` | `modules/01_the_word/01_foundational_layer/README.md` | page |
| `/the-word/foundational-layer/covenantal-philosophy` | `modules/01_the_word/01_foundational_layer/covenantal_philosophy.md` | page |
| `/the-word/diagnostic-engine` | `modules/01_the_word/02_diagnostic_engine/README.md` | page |
| `/the-word/diagnostic-engine/categories/metaphysics` | `modules/01_the_word/02_diagnostic_engine/categories/01_metaphysics.md` | page |
| `/the-word/diagnostic-engine/categories/epistemology` | `modules/01_the_word/02_diagnostic_engine/categories/02_epistemology.md` | page |
| `/the-word/diagnostic-engine/categories/anthropology` | `modules/01_the_word/02_diagnostic_engine/categories/03_anthropology.md` | page |
| `/the-word/diagnostic-engine/categories/ethics` | `modules/01_the_word/02_diagnostic_engine/categories/04_ethics.md` | page |
| `/the-word/diagnostic-engine/categories/social-political` | `modules/01_the_word/02_diagnostic_engine/categories/05_social_political.md` | page |
| `/the-word/diagnostic-engine/categories/identity-meaning` | `modules/01_the_word/02_diagnostic_engine/categories/06_identity_meaning.md` | page |
| `/the-word/diagnostic-engine/categories/eschatology` | `modules/01_the_word/02_diagnostic_engine/categories/07_eschatology.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/README.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/consumerism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/consumerism.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/expressive-individualism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/expressive_individualism.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/materialism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/materialism.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/postmodernism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/postmodernism.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/progressivist-utopianism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/progressivist_utopianism.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/technocratic-rationalism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/technocratic_rationalism.md` | page |
| `/the-word/diagnostic-engine/philosophy-modules/therapeutic-anthropology` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/therapeutic_anthropology.md` | page |
| `/the-word/diagnostic-engine/western-christianity-diagnostic-map` | `modules/01_the_word/02_diagnostic_engine/western_christianity_diagnostic_map.md` | page |
| `/the-word/diagnostic-engine/walk` | `content/data/diagnostic_walk.json` | tool |
| `/the-word/diagnostic-engine/reference/philosophy-module-template` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/_template.md` | reference |
| `/the-word/berean-tool` | `modules/01_the_word/03_berean_tool/README.md` | page |
| `/the-word/berean-tool/how-to-use` | `modules/01_the_word/03_berean_tool/how_to_use.md` | page |
| `/the-word/berean-tool/profile-builder` | `modules/01_the_word/03_berean_tool/schemas/berean_input.schema.json` | tool |
| `/the-word/berean-tool/system-design` | `modules/01_the_word/03_berean_tool/system_design.md` | page |
| `/the-word/berean-tool/tradition-influence-map` | `modules/01_the_word/03_berean_tool/tradition_influence_map.md` | page |
| `/the-word/berean-tool/sample-profiles/composite-example` | `modules/01_the_word/03_berean_tool/sample_profiles/composite_example.md` | page |
| `/the-word/berean-tool/reference/berean-profile-template` | `modules/01_the_word/03_berean_tool/berean_profile_template.md` | reference |
| `/the-word/berean-tool/reference/berean-input-schema` | `modules/01_the_word/03_berean_tool/schemas/berean_input.schema.json` | reference |
| `/the-word/berean-tool/reference/berean-profile-schema` | `modules/01_the_word/03_berean_tool/schemas/berean_profile.schema.json` | reference |
| `/the-word/language-module` | `modules/01_the_word/04_language_module/README.md` | page |
| `/the-word/language-module/linguistic-foundations` | `modules/01_the_word/04_language_module/linguistic_foundations.md` | page |
| `/the-word/language-module/linguistic-scanner-design` | `modules/01_the_word/04_language_module/linguistic_scanner_design.md` | page |
| `/the-word/language-module/two-major-distortions` | `modules/01_the_word/04_language_module/two_major_distortions.md` | page |
| `/the-word/language-module/worldly-vs-covenantal-dictionary` | `modules/01_the_word/04_language_module/worldly_vs_covenantal_dictionary.md` | page |
| `/the-word/language-module/reference/language-diagnostic-schema` | `modules/01_the_word/04_language_module/schemas/language_diagnostic.schema.json` | reference |
| `/the-word/formation` | `modules/01_the_word/05_formation_layer/README.md` | page |
| `/the-word/formation/reformation-pathway` | `modules/01_the_word/05_formation_layer/reformation_pathway.md` | page |
| `/the-word/formation/come-to-the-table` | `modules/01_the_word/05_formation_layer/come_to_the_table/README.md` | page |
| `/the-word/formation/come-to-the-table/philosophy` | `modules/01_the_word/05_formation_layer/come_to_the_table/PHILOSOPHY.md` | page |
| `/the-word/formation/come-to-the-table/session-format` | `modules/01_the_word/05_formation_layer/come_to_the_table/SESSION_FORMAT.md` | page |
| `/the-word/formation/come-to-the-table/host-guide` | `modules/01_the_word/05_formation_layer/come_to_the_table/HOST_GUIDE.md` | page |
| `/the-word/formation/come-to-the-table/guest-family-guide` | `modules/01_the_word/05_formation_layer/come_to_the_table/GUEST_FAMILY_GUIDE.md` | page |
| `/the-word/formation/come-to-the-table/canonical-arc` | `modules/01_the_word/05_formation_layer/come_to_the_table/CANONICAL_ARC.md` | page |
| `/the-word/formation/come-to-the-table/age-bands` | `modules/01_the_word/05_formation_layer/come_to_the_table/AGE_BANDS.md` | page |
| `/the-word/formation/come-to-the-table/authors-and-languages` | `modules/01_the_word/05_formation_layer/come_to_the_table/AUTHORS_AND_LANGUAGES.md` | page |
| `/the-word/formation/come-to-the-table/berean-at-the-table` | `modules/01_the_word/05_formation_layer/come_to_the_table/BEREAN_AT_THE_TABLE.md` | page |
| `/the-word/formation/come-to-the-table/seasonal-liturgy` | `modules/01_the_word/05_formation_layer/come_to_the_table/SEASONAL_LITURGY.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/opening` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/opening.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/reading` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/reading.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/closing` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/closing.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/spring` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/spring.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/summer` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/summer.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/fall` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/fall.md` | page |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/winter` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/winter.md` | page |
| `/the-word/formation/harvest-and-hymn` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/README.md` | page |
| `/the-word/formation/harvest-and-hymn/philosophy` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/PHILOSOPHY.md` | page |
| `/the-word/formation/harvest-and-hymn/seasonal-rhythm` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/SEASONAL_RHYTHM.md` | page |
| `/the-word/formation/harvest-and-hymn/gathering-format` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/GATHERING_FORMAT.md` | page |
| `/the-word/formation/harvest-and-hymn/elder-guide` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/ELDER_GUIDE.md` | page |
| `/the-word/formation/harvest-and-hymn/family-preparation` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/FAMILY_PREPARATION.md` | page |
| `/the-word/formation/harvest-and-hymn/workshops` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/WORKSHOPS.md` | page |
| `/the-word/formation/harvest-and-hymn/liturgies/spring` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/spring.md` | page |
| `/the-word/formation/harvest-and-hymn/liturgies/summer` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/summer.md` | page |
| `/the-word/formation/harvest-and-hymn/liturgies/fall` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/fall.md` | page |
| `/the-word/formation/harvest-and-hymn/liturgies/winter` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/winter.md` | page |

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
| `/the-compact/subsidiarity` | `modules/03_the_compact/SUBSIDIARITY.md` | page |
| `/the-compact/commons-and-shared-life` | `modules/03_the_compact/COMMONS_AND_SHARED_LIFE.md` | page |
| `/the-compact/peoplehood` | `modules/03_the_compact/PEOPLEHOOD.md` | page |
| `/the-compact/local-market-and-social-fabric` | `modules/03_the_compact/LOCAL_MARKET_AND_SOCIAL_FABRIC.md` | page |
| `/the-compact/hebraic-word-studies` | `modules/03_the_compact/HEBRAIC_WORD_STUDIES.md` | page |
| `/the-compact/formation-questions` | `modules/03_the_compact/FORMATION_QUESTIONS.md` | tool |

---

## Homepage pattern — The Covenant Map

- The homepage at `/` is **The Covenant Map**: a five-region visual entry point that introduces the full formation terrain.
- It uses **no navigation bar**. Entry happens through the map itself, a short orientation sentence, and slow reveal motion that invites walking rather than skimming.
- The five regions correspond to The Word's five-pathway terrain so the homepage can visually foreshadow the deeper architecture before the user moves into the three primary modules.
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

### B. Diagnostic Engine Walk

- **Route:** `/the-word/diagnostic-engine/walk`
- **Source:** [`content/data/diagnostic_walk.json`](../content/data/diagnostic_walk.json)
- **Form:** a seven-category guided reflection in canonical order: Metaphysics, Epistemology, Anthropology, Ethics, Social/Political, Identity/Meaning, Eschatology.
- **Interaction:** one category at a time, with central question, four diagnostic questions, covenantal contrast, rival philosophies, and a closing reflection prompt.
- **Copy rule:** all content must remain sourced from the existing category markdown files.

### C. Berean Tool

- **Route:** `/the-word/berean-tool/profile-builder`
- **Sources:** `modules/01_the_word/03_berean_tool/schemas/berean_input.schema.json` and `modules/01_the_word/03_berean_tool/schemas/berean_profile.schema.json`
- **Form:** structured profile builder that gathers inputs, validates against the existing schema, and renders a local-only profile preview.
- **Interaction:** guided sections for source identification, diagnostic categories, influence mapping, and covenantal contrast summary.
- **Persistence:** no submission and no remote save; export and print are client-side only.

### D. Compact Builder

- **Route:** `/the-compact/formation-questions`
- **Source:** [`content/data/compact_builder.json`](../content/data/compact_builder.json)
- **Form:** localStorage-backed reflection tool organized into the three module sections from `modules/03_the_compact/FORMATION_QUESTIONS.md`.
- **Interaction:** users can move section by section, save reflection text locally, and trigger client-side print/export views using `export_label` and `print_title` metadata.
- **Copy rule:** the capstone question copy is authored in `modules/03_the_compact/FORMATION_QUESTIONS.md` and mirrored in `content/data/compact_builder.json` for the interactive tool; the two sources must stay in sync.

### E. Hebrew Word Cards

- **Routes:** embedded inside relevant content pages, especially `/the-word/language-module/worldly-vs-covenantal-dictionary`, `/the-household/hebraic-word-studies`, and `/the-compact/hebraic-word-studies`.
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

## Navigation strategy for The Word formation subtree

- The main `/the-word` experience should not expose the full formation subtree immediately.
- Use **progressive disclosure**: the formation layer sub-navigation appears only inside `/the-word/formation/`.
- Once the user is inside `/the-word/formation/`, expose local sub-nav for `come-to-the-table`, `harvest-and-hymn`, and their child pages only.
- Do not surface the formation subtree in a global header or on the homepage.

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

- [`content/data/diagnostic_walk.json`](../content/data/diagnostic_walk.json) — canonical data pack for the Diagnostic Engine Walk
- [`content/data/compact_builder.json`](../content/data/compact_builder.json) — canonical data pack for the Compact Builder
- Existing Berean schemas under `modules/01_the_word/03_berean_tool/schemas/` remain the canonical structured source for the Berean Tool builder