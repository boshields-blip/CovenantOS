# CovenantOS Content Layer

**Status:** Draft  
**Owner:** @boshields-blip  
**Last updated:** 2026-06-12

---

## Overview

This directory contains the markdown-first content for the five layers of CovenantOS. It is the heart of the product: before any Flutter widget is written, the formation content lives here in plain text, version-controlled and readable by anyone.

The 5-layer structure reflects a deliberate dependency order. Lower layers are stable foundations; higher layers build on them. A layer may reference any layer below it, but never a layer above it.

---

## Tree structure

```
covenant_os/
├── 01_foundational_layer/   — first principles and operating frame
├── 02_diagnostic_engine/    — beliefs, contradictions, and pattern diagnostics
├── 03_berean_tool/          — scripture and text examination tools
├── 04_language_module/      — covenantal terminology and formation language
└── 05_formation_layer/
    ├── come_to_the_table/   — Come to the Table practice
    └── harvest_and_hymn/    — Harvest and Hymn practice
```

## Navigation

- See [`docs/ARCHITECTURE.md`](../docs/ARCHITECTURE.md) for the full architectural description of each layer, how they relate, and the 5-layer separation rule.
- Each layer directory has its own `README.md` describing the content that belongs there.
- Content migration from `boshields-blip/PlumbLineOS` is documented in [`MIGRATION_FROM_PLUMBLINEOS.md`](../MIGRATION_FROM_PLUMBLINEOS.md).
