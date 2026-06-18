# Migration from PlumbLineOS

**Status:** Phase 2 In Progress  
**Owner:** @boshields-blip  
**Last updated:** 2026-06-18

---

## Overview

CovenantOS is being separated from `boshields-blip/PlumbLineOS`, where a `covenant_os/` directory currently lives at the repository root. This document describes the planned migration — what moves, where it goes, and what remains behind.

**Phase 1** created the CovenantOS scaffold with fresh placeholder content. No content was moved from PlumbLineOS in that phase. **Phase 2** executes the actual moves and merges described below; it is currently in progress.

---

## Migration map

| Source in PlumbLineOS | Destination in CovenantOS | Mode | Status |
|---|---|---|---|
| `covenant_os/` (root tree, all 5 layers) | `covenant_os/` (preserve 5-layer structure) | move | ✅ Complete (scaffold seeded in Phase 1; README updated Phase 2) |
| `covenant_os/ARCHITECTURE.md` | `docs/ARCHITECTURE.md` | move + merge | ✅ Complete (promoted in scaffold) |
| `covenant_os/INTRODUCTION.md` | `docs/INTRODUCTION.md` | move + merge | ✅ Complete (promoted in scaffold) |
| `covenant_os/README.md` | `covenant_os/README.md` | move | ✅ Complete (updated Phase 2 — PlumbLineOS refs removed) |
| `lib/features/covenant_os/berean_tool/` | `lib/features/berean_tool/` | move + reorganize | ⏳ Entry-point stub created; full implementation awaits PlumbLineOS access |
| `lib/features/covenant_os/kernel/` | `lib/features/berean_tool/kernel/` | move + reorganize | ⏳ Stubs created for `interpretation_pipeline`, `kernel_principles`, `redirects`; full implementation awaits PlumbLineOS access |
| `lib/features/covenant_os/formation/` + `come_to_the_table/` | `lib/features/formation_layer/` | move + reorganize | ⏳ Entry-point stubs created; full implementation awaits PlumbLineOS access |
| `lib/features/covenant_os/the_name/` | `lib/features/language_module/` | move + reorganize | ⏳ Entry-point stub created; full implementation awaits PlumbLineOS access |
| `lib/features/covenant_os/canonical_architecture/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/covenantal_philosophy/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/domain_theology/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/faithful_work/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/heresy/` | `lib/features/berean_tool/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/sacred_trades/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/second_temple/` | `lib/features/berean_tool/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/sharing/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/further_study/` | `lib/features/berean_tool/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/covenant_lineage/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/covenant_academy/` | `lib/features/formation_layer/` | move | ⏳ Awaits PlumbLineOS access |
| `lib/features/covenant_os/covenant_os.dart` | `lib/features/covenant_os.dart` (barrel file) | move + update imports | ✅ Barrel file created with correct package paths |
| Any covenant routes in `lib/app/routes/` | `lib/app/routes/` | move | ⏳ Awaits PlumbLineOS access |
| Supabase migrations matching `*covenant*`, `*formation*`, `*berean*` | `supabase/migrations/` | move | ⏳ Awaits PlumbLineOS access |
| PlumbLineOS tombstone — `lib/features/covenant_os/covenant_os.dart` | Deprecation comment added in PlumbLineOS | tombstone | ⏳ Awaits write access grant to PlumbLineOS |

### Note on PlumbLineOS access

The `boshields-blip/PlumbLineOS` repository is private. The Phase 2 Dart code migration (populating the stub files above with the real implementation from PlumbLineOS's `lib/features/covenant_os/` subtree) requires that the agent session be granted read access to that repository. The stub files created in this PR establish the correct feature-first structure and will be replaced with migrated source when access is available.

---

## Phase boundaries

### Phase 1 — Complete ✅
- Created the CovenantOS repository structure with fresh placeholder content
- Did not touch PlumbLineOS
- Established the 5-layer `covenant_os/` tree, Flutter app skeleton, docs, and CI

### Phase 2 — In Progress ⏳
- ✅ Updated `covenant_os/README.md` — removed PlumbLineOS-centric language; made standalone
- ✅ Created `lib/features/covenant_os.dart` barrel file with correct `package:covenant_os/` paths
- ✅ Created entry-point widgets: `BereanToolPage`, `FormationLayerPage`, `ComeToTheTablePage`, `LanguageModulePage`
- ✅ Created kernel stubs: `interpretation_pipeline.dart`, `kernel_principles.dart`, `redirects.dart`
- ⏳ Full Dart implementation migration from `PlumbLineOS/lib/features/covenant_os/` subtree (requires PlumbLineOS read access)
- ⏳ Supabase migrations for `*covenant*`, `*formation*`, `*berean*` (requires PlumbLineOS read access)
- ⏳ PlumbLineOS tombstone for `lib/features/covenant_os/covenant_os.dart` (requires PlumbLineOS write access)

### Phase 3 — Not yet started
- PlumbLineOS covenant directories are **tombstoned, not deleted**, in a controlled phase
- A tombstone adds a notice pointing to CovenantOS and prevents future writes to the legacy path
- The tombstone phase is planned but not scheduled — do not delete anything from PlumbLineOS until explicitly authorized

---

## Import path convention

All migrated Dart files must use `package:covenant_os/` imports, not `package:plumb_line_os/`. Example:

```dart
// Old (PlumbLineOS) — do not use:
import 'package:plumb_line_os/features/covenant_os/berean_tool/berean_tool.dart';

// New (CovenantOS) — correct:
import 'package:covenant_os/features/berean_tool/berean_tool.dart';
```

---

## What does NOT move here

| Work | Destination |
|------|-------------|
| Homestead OS, Market OS, Wholesale OS | `boshields-blip/CommunityOS` |
| Commercial plumbing/HVAC (TradeCore) | Stays in `boshields-blip/PlumbLineOS` |
| MeshCore app layer | `boshields-blip/CommunityOS` |
| LocationOS / GPS (fleet context) | Stays in `boshields-blip/PlumbLineOS` |
| LocationOS / GPS (farm/trail context) | `boshields-blip/CommunityOS` |

CovenantOS is purely formational and philosophical. Nothing operational, commercial, or homestead-operational belongs here. If any migrated file from PlumbLineOS contains imports from commercial plumbing, HVAC, homestead, market, or wholesale code, those imports must be stripped or stubbed out before being accepted into this repository.

---

## Related repositories

- `boshields-blip/PlumbLineOS` — source of the covenant Dart code being migrated
- `boshields-blip/CommunityOS` — optional consumer of CovenantOS via the `frameOverride` hook
