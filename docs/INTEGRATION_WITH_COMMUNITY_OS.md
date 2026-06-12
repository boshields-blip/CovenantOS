# Integration with CommunityOS

**Status:** Draft  
**Owner:** @boshields-blip  
**Last updated:** 2026-06-12

---

## Summary

CovenantOS may be optionally surfaced inside `boshields-blip/CommunityOS` via a `frameOverride` hook on Homestead Academy tracks. This integration is entirely one-way:

> **CommunityOS optionally depends on CovenantOS. CovenantOS does NOT depend on CommunityOS.**

CovenantOS has no imports from, no runtime dependencies on, and no schema coupling with CommunityOS. It is a standalone product that happens to be usable as a formation overlay in a CommunityOS context.

---

## The `frameOverride` hook

Homestead Academy tracks in CommunityOS have a `frameOverride` extension point on their intro card. By default, an Academy track opens with a standard intro card describing the track's operational focus (e.g., "Managing your first harvest season"). When a CovenantOS formation frame is available for that track and the user has opted into covenant formation, the default intro card is replaced with a Covenant-flavored card that situates the practical skill within a formation frame.

### How it works

1. Each CommunityOS Academy track defines an optional `frameOverride` key.
2. CovenantOS publishes formation frames that map to track keys (e.g., a "first harvest" track might have a corresponding "abundance and gratitude" formation frame in the Language Module and Formation Layer).
3. When CommunityOS loads an Academy track, it checks whether a `frameOverride` is present for that track key and whether the user has CovenantOS enabled.
4. If both conditions are met, the Covenant formation card is rendered in place of — or as a header above — the default intro card.

### What does NOT change

- No schema changes in CommunityOS are required.
- No schema changes in CovenantOS are required.
- The hook is a pure content/presentation overlay — it does not alter business logic, data models, or permissions in either system.
- The override is strictly optional. CommunityOS functions identically without it.

---

## Dependency direction (explicit)

```
CommunityOS ──(optional, one-way)──► CovenantOS
                                         │
                                         │  (formation frames, frameOverride content)
                                         ▼
                                  No reverse dependency
```

CovenantOS must never import from CommunityOS. If you find yourself adding a CommunityOS import to this repository, stop and reconsider — the integration direction is wrong.

---

## Why this design?

This design preserves CovenantOS's independence. CovenantOS is a standalone formational tool with users who have no connection to homesteading or community market operations. If CovenantOS were tightly coupled to CommunityOS, it would:

- Create a hard dependency that prevents CovenantOS from being used independently
- Force CovenantOS release cycles to track CommunityOS changes
- Blur the philosophical/formational purpose of CovenantOS with operational concerns

The `frameOverride` pattern keeps the seam clean: CommunityOS reaches out when it wants formation context; CovenantOS simply provides it and has no awareness of the operational context it is enriching.

---

## Supabase considerations

CovenantOS and CommunityOS share a Supabase project in production, which means users can have a unified identity across both tools. However, the schema tables are distinct — there are no foreign keys or joins that cross the CovenantOS/CommunityOS boundary at the application layer. The shared project is an operational convenience, not a coupling point. See [`docs/SUPABASE.md`](SUPABASE.md) for details.

---

## Related

- [`docs/ARCHITECTURE.md`](ARCHITECTURE.md) — full 5-layer architecture and integration notes
- [`boshields-blip/CommunityOS`](https://github.com/boshields-blip/CommunityOS) — the consuming application
