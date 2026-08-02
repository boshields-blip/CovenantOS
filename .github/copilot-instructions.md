# Copilot Instructions — CovenantOS 2.0

## What this repo is

CovenantOS is a **static SvelteKit 2.0 site for covenantal formation**. It is not operational software, not a trade management system, and not a homestead platform.

**This repo is for:**
- A static SvelteKit site built with `@sveltejs/adapter-static`
- Markdown-first module content authored in `modules/`
- Structured interactive content in `content/data/*.json`
- Guided, local-only reflection tools that persist to `localStorage`
- The three CovenantOS modules: **The Word**, **The Household**, and **The Compact**

**This repo is NOT for:**
- Plumbing, HVAC, or commercial trade operations → `boshields-blip/PlumbLineOS`
- Homestead, farm, market, wholesale, MeshCore, or GPS operations → `boshields-blip/CommunityOS`
- Accounts, memberships, forums, or backend-managed community features
- Supabase schemas, migrations, or environment-variable-driven runtimes

If a user asks for operational, commercial, plumbing-related, or homestead-operational features here, redirect them to the correct repository.

---

## Core architecture

### Runtime posture

- **Framework:** SvelteKit 2.0
- **Adapter:** `@sveltejs/adapter-static`
- **Styling:** Tailwind CSS
- **Markdown pipeline:** mdsvex
- **Persistence:** browser `localStorage` only for reflection tools
- **Backend:** none
- **Accounts/auth:** none
- **Supabase:** none

### Module structure

CovenantOS is organized into three modules:

1. **The Word**
   - Content source of truth: `modules/01_the_word/`
   - Structured as six movements:
     - `01_the_land_of_the_text`
     - `02_the_language_of_the_land`
     - `03_walking_the_text`
     - `04_knowing_your_own_way`
     - `05_the_streams_of_the_traditions`
     - `06_living_the_covenant`
2. **The Household**
   - Content source of truth: `modules/02_the_household/`
3. **The Compact**
   - Content source of truth: `modules/03_the_compact/`

Interactive tool data lives in `content/data/*.json`.

---

## Canonical documents

When architecture or route questions arise, use these in order:

1. `docs/WEB_ARCHITECTURE.md` — canonical architecture and behavior rules
2. `docs/ROUTE_MATRIX.md` — canonical route-to-content ownership
3. `docs/DESIGN_PRINCIPLES.md` — design posture and sequencing rationale
4. `docs/ARCHITECTURE.md` — repository/module boundary summary

---

## Build and development

Use the existing npm workflow:

```bash
npm install
npm run dev
npm run build
```

Do not introduce Flutter, Dart, or Supabase tooling back into this repository.

---

## Design posture rules

Follow the canonical design rules from `docs/WEB_ARCHITECTURE.md`:

- **Reading width:** main text columns max out at **720px**
- **Color palette:**
  - Parchment `#F5EDD6`
  - Charcoal `#2C2417`
  - Ochre `#8B6914`
  - Slate `#5A6B7A`
  - Sage `#6B7C5C`
- **Motion principles:** slow fades, gentle staggered reveals, no snapping transitions for panels or drawers
- **Sequence banners:** direct entry into **The Household** or **The Compact** must show the contextual banner that reminds the user The Word forms the foundation
- **localStorage disclosure:** every tool page that stores reflections must clearly say: *"Your reflections are saved only on this device. Nothing is sent anywhere."*
- **Clear control:** every local-only reflection tool must expose a **Clear saved reflections** action

---

## Content and implementation conventions

- Treat `modules/` and `content/data/*.json` as the content source of truth
- Keep the experience markdown-first and content-first
- Prefer static generation and local interaction over any remote runtime behavior
- Use `snake_case` for directories and `lower_snake_case` for file names
- Keep CommunityOS integration one-way only; CovenantOS does not import CommunityOS internals

---

## Repository boundary reminder

CovenantOS explains the **why** of covenantal life. CommunityOS handles the operational **how**. Keep CovenantOS focused on formation, reflection, reading, comparison, and guided practice.
