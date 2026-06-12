# Copilot Instructions — CovenantOS

## What this repo is

CovenantOS is a **philosophical and formational tool**. It is not operational software. It is not a trade management system. It is not a homestead platform.

**This repo is for:**
- The 5-layer philosophical formation architecture
- Berean Tool (scripture and text examination)
- Language Module (covenantal terminology and vocabulary formation)
- Formation Layer (embodied practices: Come to the Table, Harvest and Hymn)
- Diagnostic Engine (surfaces beliefs, contradictions, and patterns)
- Foundational Layer (first principles and frame)

**This repo is NOT for:**
- Plumbing, HVAC, or commercial trade operations → those belong in `boshields-blip/PlumbLineOS`
- Homestead, farm, harvest batch logging, pantry management → those belong in `boshields-blip/CommunityOS`
- Market OS (storefront, inventory, orders) → `boshields-blip/CommunityOS`
- Wholesale OS (bulk orders, events, businesses) → `boshields-blip/CommunityOS`
- MeshCore BLE/GPS firmware or app layer → `boshields-blip/CommunityOS`

If a user asks you to add anything operational, commercial, plumbing-related, or homestead-operational to this repo, redirect them to the appropriate repository above.

---

## Related repositories

| Repo | Purpose |
|------|---------|
| `boshields-blip/PlumbLineOS` | TradeCore — commercial plumbing/HVAC OS. Source of the covenant content being migrated to this repo. Do not add covenant work back to PlumbLineOS. |
| `boshields-blip/CommunityOS` | Homestead OS, Market OS, Wholesale OS, MeshCore, LocationOS/GPS. CovenantOS is optionally surfaced here via the `frameOverride` hook on Homestead Academy tracks. |

---

## 5-layer separation rule

CovenantOS has a strict 5-layer hierarchy:

```
Layer 1 — Foundational Layer    (first principles, frame)
Layer 2 — Diagnostic Engine     (beliefs, contradictions, patterns)
Layer 3 — Berean Tool           (scripture/text examination)
Layer 4 — Language Module       (terminology, formation language)
Layer 5 — Formation Layer       (practices: Come to the Table, Harvest and Hymn)
```

**The rule:** Lower layers must NOT reference higher layers. Downward references are fine; upward references are not allowed.

- Layer 1 content must not depend on Layer 2–5 implementations.
- Layer 3 (Berean Tool) may reference Layers 1–2, but not Layers 4–5.
- Layer 5 (Formation Layer) may reference any layer below it.

Enforce this rule in both the `covenant_os/` markdown content tree and in the `lib/features/` Flutter code.

---

## Integration with CommunityOS

The relationship between CovenantOS and CommunityOS is **one-way**:

- CommunityOS **optionally** consumes CovenantOS via a `frameOverride` hook.
- CovenantOS does **not** import from, depend on, or reference CommunityOS internals.
- The hook allows a Covenant-flavored intro card to replace the default Homestead Academy intro card without schema changes in either repo.

Do not add CommunityOS imports or dependencies to this repo.

---

## Conventions

- **Markdown-first** for the `covenant_os/` content layer tree
- **Flutter feature-first** for app code under `lib/features/`
- **snake_case** for all directory names; **lower_snake_case** for file names
- All docs in `docs/` and layer READMEs start with an H1 title and a status block:
  ```
  Status: Draft | Owner: @boshields-blip | Last updated: YYYY-MM-DD
  ```
- No Supabase credentials or live environment variables in this repo
- No plumbing/HVAC terminology, homestead market/wholesale operations, or MeshCore firmware here

---

## Stack

- Flutter / Dart (feature-first architecture under `lib/features/`)
- Markdown content layers (`covenant_os/` tree)
- Supabase backend (shares project with CommunityOS in production — no live env vars here)
- GitHub Actions CI (`.github/workflows/ci.yml`)
