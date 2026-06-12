# Architecture

**Status:** Draft  
**Owner:** @boshields-blip  
**Last updated:** 2026-06-12

---

## Overview

CovenantOS is structured around five discrete layers, each building on the one below it. The layers form a dependency hierarchy: lower layers are foundational and do not depend on higher layers, while higher layers may draw on any layer below them. This structure ensures that core formation principles remain stable and independent, even as practices and tools evolve in the upper layers.

---

## The 5 Layers

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

```
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

The `lib/features/` directory mirrors the layer structure:

| Feature directory | Corresponding layer |
|---|---|
| `lib/features/berean_tool/` | Layer 3 — Berean Tool |
| `lib/features/language_module/` | Layer 4 — Language Module |
| `lib/features/formation_layer/` | Layer 5 — Formation Layer |
| `lib/features/covenant_forum/` | Cross-cutting — community/forum surfaces for formation practices |

The same 5-layer separation rule applies to Dart code: lower-layer feature packages must not import from higher-layer feature packages.

---

## Optional integration with CommunityOS

CovenantOS may be optionally surfaced inside `boshields-blip/CommunityOS` via a `frameOverride` hook on Homestead Academy tracks. The relationship is strictly **one-way**:

- **CommunityOS** optionally imports a Covenant formation frame and displays it as an overlay on Homestead Academy track intros.
- **CovenantOS** has no knowledge of CommunityOS, Homestead OS, Market OS, or Wholesale OS.

The hook works as follows: CommunityOS defines a `frameOverride` contract on each Academy track. When a CovenantOS formation frame is available and the user has opted into it, the default intro card is replaced by a Covenant-flavored card. No schema changes are required in either repository; the override is a pure content/presentation overlay.

See [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](INTEGRATION_WITH_COMMUNITY_OS.md) for full integration details.

---

## Content layer (`covenant_os/` tree)

The `covenant_os/` directory contains the markdown-first content for all five layers:

```
covenant_os/
├── README.md                            — tree overview and navigation
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

CovenantOS shares a Supabase project with CommunityOS in production. PlumbLineOS uses its own separate Supabase project. See [`docs/SUPABASE.md`](SUPABASE.md) for details.
