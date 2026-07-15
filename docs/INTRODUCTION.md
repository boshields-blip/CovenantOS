# Introduction to CovenantOS

**Status:** Active | **Owner:** @boshields-blip | **Last updated:** 2026-07-15

---

## What is CovenantOS?

CovenantOS is a **philosophical formation tool** — a structured system for helping individuals and communities examine what they believe, how they speak, and how they practice life together in covenant. It is not software for managing inventory, processing orders, tracking harvests, or routing service calls. Those concerns belong to other systems in this family of tools.

CovenantOS is built on the conviction that formation is both intellectual and embodied: it requires clear thinking (the Foundational Layer and Diagnostic Engine), rigorous engagement with primary sources (the Berean Tool), precise language (the Language Module), and practiced, repeated, embodied rhythms (the Formation Layer). The five-layer architecture reflects this conviction — each layer does one thing well, and the layers build on each other in a deliberate order.

---

## Who is CovenantOS for?

CovenantOS is for:

- **Individuals** working through belief formation and wanting to examine the gap between what they say they believe and what their patterns and choices reveal they actually believe
- **Communities** — households, churches, small groups — who want to develop shared covenantal language and embodied formation practices
- **Facilitators** of the "Come to the Table" and "Harvest and Hymn" practices who need structured content and guides
- **Homestead Academy participants** who have opted into a Covenant-flavored formation track (see the optional `frameOverride` integration with CommunityOS)

CovenantOS is **not** for:
- Commercial plumbing or HVAC operations (see PlumbLineOS)
- Homestead farm management, market operations, or wholesale sourcing (see CommunityOS)
- Anything primarily operational, commercial, or transactional

The product is valuable to someone who has never homesteaded and who has no connection to a trade business. Covenant formation is its own concern.

---

## Why is CovenantOS separate from PlumbLineOS and CommunityOS?

The philosophical reasons are simple: fundamentally different domains should not share a repository. CovenantOS is formational; PlumbLineOS is commercial; CommunityOS is operational. These serve different users, have different release cadences, and grow in different directions.

The practical reasons are just as compelling:

1. **Different users.** A plumber using TradeCore (PlumbLineOS) is not the same person as someone working through a Berean Tool scripture study. Even when the same person uses both tools, the contexts are distinct and should remain so.
2. **Different content types.** CovenantOS is markdown-heavy — it is primarily a content system with a Flutter presentation layer. PlumbLineOS and CommunityOS are primarily operational apps with complex backend schemas.
3. **Different velocities.** Formation content matures slowly and thoughtfully. Operational software ships fast. Mixing them creates friction in both directions.
4. **Standalone value.** CovenantOS is worth using without any homestead, market, or plumbing context. It deserves to stand on its own.

CovenantOS content originated in PlumbLineOS, where a `covenant_os/` directory grew organically. See [`MIGRATION_FROM_PLUMBLINEOS.md`](../MIGRATION_FROM_PLUMBLINEOS.md) for the migration history and transitional ledger.

---

## The 5-layer architecture at a glance

```
1. Foundational Layer  — first principles and operating frame
2. Diagnostic Engine   — surfaces beliefs, contradictions, and patterns
3. Berean Tool         — scripture and text examination
4. Language Module     — covenantal terminology and formation language
5. Formation Layer     — embodied practices (Come to the Table; Harvest and Hymn)
```

Each layer builds on the layers below it. Lower layers are stable and do not depend on higher layers. The full ownership and boundary model is described in [`docs/ARCHITECTURE.md`](ARCHITECTURE.md).

---

## How to navigate this repository

- **`covenant_os/`** — the markdown-first content tree for all five layers. Start here to read or contribute formation content.
- **`lib/`** — the Flutter app that presents the content. Feature-first structure mirroring the 5-layer architecture.
- **`docs/ARCHITECTURE.md`** — canonical ownership boundaries, runtime responsibilities, and handoff behavior.
- **`docs/INTEGRATION_WITH_COMMUNITY_OS.md`** — canonical CommunityOS integration contract.
- **`docs/SUPABASE.md`** — canonical shared-project and data-boundary rules.
- **`MIGRATION_FROM_PLUMBLINEOS.md`** — migration history and transitional plan from PlumbLineOS.

If this introduction conflicts with the architecture docs above, the architecture docs are authoritative.
