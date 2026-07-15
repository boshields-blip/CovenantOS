# Architecture

**Status:** Active | **Owner:** @boshields-blip | **Last updated:** 2026-07-15

---

## Overview

CovenantOS is a standalone philosophical and formational product structured around five discrete layers, each building on the one below it. The layers form a dependency hierarchy: lower layers are foundational and do not depend on higher layers, while higher layers may draw on any layer below them. This structure keeps core formation principles stable while allowing practices, language, and presentation flows to evolve without blurring product boundaries.

---

## Canonical source-of-truth map

Use the following authority order when architecture language overlaps:

| Document | Authority | Use |
|---|---|---|
| `docs/ARCHITECTURE.md` | Canonical | Ownership boundaries, layer rules, runtime responsibilities, and handoff behavior |
| `docs/INTEGRATION_WITH_COMMUNITY_OS.md` | Canonical | CommunityOS integration contract and fallback behavior |
| `docs/SUPABASE.md` | Canonical | Shared-project data boundary, naming rules, and credential posture |
| `MIGRATION_FROM_PLUMBLINEOS.md` | Transitional | Migration ledger and phase history; not the steady-state source of truth |
| `docs/PR3_PLUMBLINEOS_CUTOVER.md` | Transitional | PlumbLineOS tombstone/redirect checklist during cutover |
| `README.md` and `docs/INTRODUCTION.md` | Orientation | Entry points and summaries; defer to canonical docs if wording diverges |

---

## Ownership and boundary matrix

| Domain / capability | Owned by CovenantOS | Explicitly not owned by CovenantOS | Boundary / handoff contract |
|---|---|---|---|
| 5-layer formation architecture | Yes — `covenant_os/` and matching Flutter features | Trade workflows, homestead operations, commerce | Lower layers must not reference higher layers |
| Covenant onboarding, formation runtime, and group/forum flows | Yes — `lib/features/covenant_onboarding/`, `formation_layer/`, `covenant_forum/` | TradeCore onboarding, CommunityOS Academy runtime | CovenantOS owns covenant invite acceptance and covenant write paths |
| CommunityOS Academy intro framing | No — CommunityOS owns Academy tracks and intro card lifecycle | CovenantOS does not own track schemas, permissions, or Academy business logic | CommunityOS may optionally consume a CovenantOS `frameOverride`; fallback is the default Academy intro |
| PlumbLineOS covenant route cutover | No — PlumbLineOS owns TradeCore routes and tombstones | CovenantOS does not own TradeCore redirects after handoff | PlumbLineOS must tombstone old covenant routes and deep link to CovenantOS without writing data |
| Shared auth / shared Supabase project with CommunityOS | CovenantOS owns its own tables, policies, and migrations in the shared project | CovenantOS does not own CommunityOS tables or shared-project internals beyond covenant scope | Shared identity is allowed; application-layer joins or reverse dependencies are not |
| TradeCore plumbing / HVAC domain | No | PlumbLineOS owns it | Redirect users to PlumbLineOS for operational trade work |
| Homestead / market / wholesale / MeshCore domain | No | CommunityOS owns it | Redirect users to CommunityOS for operational homestead or commerce work |

---

## The 5 layers

### Layer 1 — Foundational Layer

The Foundational Layer contains the first principles and operating frame of CovenantOS. It defines the core assumptions about personhood, covenant, formation, and community that orient everything else in the system.

Content in this layer includes:
- The philosophical and theological first principles that ground the entire framework
- Definitions of key terms at their most fundamental level (before elaboration in the Language Module)
- The governing frame for how CovenantOS understands formation, community, and covenant

**Rule:** The Foundational Layer does not reference any other layer. It is the bedrock. All other layers may reference it.

---

### Layer 2 — Diagnostic Engine

The Diagnostic Engine surfaces beliefs, contradictions, and patterns in an individual's or group's formation journey. It provides structured tools for examining what someone actually believes versus what they say they believe, and for identifying where formation is fragile or incomplete.

Content in this layer includes:
- Diagnostic frameworks and rubrics
- Belief-mapping structures (e.g., "stated belief" vs. "revealed belief" patterns)
- Contradiction identification tools
- Pattern recognition prompts and templates

The Diagnostic Engine draws on the Foundational Layer's first principles to establish what counts as a contradiction or a healthy pattern. It does not reference the Berean Tool, Language Module, or Formation Layer.

---

### Layer 3 — Berean Tool

The Berean Tool is a scripture and text examination tool. Named after the Bereans of Acts 17 who examined the scriptures daily to verify what they were taught, this layer provides structured approaches to engaging primary sources — chiefly scripture, but also other formative texts.

Content in this layer includes:
- Scripture examination templates and frameworks
- Text study structures (observation, interpretation, application)
- Cross-reference and comparison tools
- Guidance for examining sources in light of the Foundational Layer's principles

The Berean Tool draws on Layers 1–2. It does not reference the Language Module or Formation Layer.

---

### Layer 4 — Language Module

The Language Module builds a shared covenantal vocabulary and formation language. Language is not neutral; the words a community uses to describe reality shape how it understands and practices covenant. This layer works to establish precise, formative language that is grounded in the Foundational Layer and informed by the Diagnostic Engine and Berean Tool.

Content in this layer includes:
- Glossary of covenantal terms with definitions and usage notes
- Formation language guides (how to speak about persons, community, failure, restoration)
- Terminology for the practices described in the Formation Layer
- Language patterns that reinforce healthy formation and language patterns that undermine it

The Language Module draws on Layers 1–3. It does not reference the Formation Layer.

---

### Layer 5 — Formation Layer

The Formation Layer contains the embodied practices through which the principles, diagnostics, tools, and language of the lower layers are lived out in community. Formation is not merely intellectual — it is practiced, repeated, and embodied.

Content in this layer includes:
- **Come to the Table** — a liturgical and relational practice for community gathering, examination, and recommitment
- **Harvest and Hymn** — a seasonal practice that connects the rhythms of creation with the rhythms of formation
- Practice guides, facilitator notes, and community rhythms
- Templates for formation group sessions

The Formation Layer draws on all four layers below it and is the only layer permitted to reference all others.

---

## Layer dependency diagram

```text
Layer 5 — Formation Layer
    ↓ may reference Layers 1–4

Layer 4 — Language Module
    ↓ may reference Layers 1–3

Layer 3 — Berean Tool
    ↓ may reference Layers 1–2

Layer 2 — Diagnostic Engine
    ↓ may reference Layer 1

Layer 1 — Foundational Layer
    (no references to other layers)
```

**Rule:** Upward references are not allowed. A lower layer must never import from, link to, or depend on a higher layer.

---

## Flutter app architecture

The `lib/features/` directory mirrors the layer structure and adds limited cross-cutting surfaces:

| Feature directory | Role |
|---|---|
| `lib/features/berean_tool/` | Layer 3 — Berean Tool |
| `lib/features/language_module/` | Layer 4 — Language Module |
| `lib/features/formation_layer/` | Layer 5 — Formation Layer |
| `lib/features/covenant_onboarding/` | CovenantOS-specific onboarding and invite acceptance |
| `lib/features/covenant_forum/` | Cross-cutting community/forum surfaces that support formation practices |

The same 5-layer separation rule applies to Dart code: lower-layer feature packages must not import from higher-layer feature packages. Cross-cutting surfaces must not create backdoor upward dependencies.

---

## Boundary operating model

### What CovenantOS owns

- The formational content tree under `covenant_os/`
- CovenantOS-specific presentation, onboarding, and formation runtime in `lib/`
- Covenant-specific tables and migrations in `supabase/migrations/`
- Covenant invite acceptance, covenant entitlements, and covenant formation records

### What CovenantOS does not own

- PlumbLineOS trade workflows, trade routes, or commercial plumbing / HVAC operations
- CommunityOS homestead, market, wholesale, MeshCore, or Academy business logic
- Cross-repo reverse imports, shared app-layer models, or shared routing ownership

### Boundary behavior

#### CommunityOS handoff

- CommunityOS owns the Academy track and intro-card lifecycle.
- CovenantOS may supply optional formation framing through the `frameOverride` contract.
- If CovenantOS content is unavailable, disabled, or invalid, CommunityOS falls back to its default Academy intro card.
- The integration is presentation/content-only: no cross-repo write path, no schema coupling, and no reverse dependency from CovenantOS into CommunityOS.

#### PlumbLineOS handoff

- PlumbLineOS must tombstone legacy covenant routes after cutover.
- Tombstones may deep link to CovenantOS when a launch target is available.
- If a deep link is unavailable, the tombstone should show an informative redirect message and stop.
- Tombstones must not write data, call covenant RPCs, or preserve competing TradeCore write paths.

#### Shared data boundary

- CovenantOS and CommunityOS may share a Supabase project in production.
- The shared project enables shared identity, not shared application ownership.
- CovenantOS tables stay covenant-prefixed and application behavior must not rely on cross-product joins or reverse imports.
- PlumbLineOS remains on a separate Supabase project.

---

## Content layer (`covenant_os/` tree)

The `covenant_os/` directory contains the markdown-first content for all five layers:

```text
covenant_os/
├── README.md                            — content tree overview and navigation
├── 01_foundational_layer/README.md      — first principles and frame
├── 02_diagnostic_engine/README.md       — beliefs, contradictions, patterns
├── 03_berean_tool/README.md             — scripture/text examination
├── 04_language_module/README.md         — covenantal terminology
└── 05_formation_layer/
    ├── README.md                        — formation practices overview
    ├── come_to_the_table/README.md      — Come to the Table practice
    └── harvest_and_hymn/README.md       — Harvest and Hymn practice
```

---

## Supabase

CovenantOS shares a Supabase project with CommunityOS in production, while PlumbLineOS uses a separate project. See [`docs/SUPABASE.md`](SUPABASE.md) for data-boundary details.
