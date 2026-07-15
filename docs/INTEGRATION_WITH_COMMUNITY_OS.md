# Integration with CommunityOS

**Status:** Active | **Owner:** @boshields-blip | **Last updated:** 2026-07-15

---

## Summary

CovenantOS may be optionally surfaced inside CommunityOS via a `frameOverride` hook on Homestead Academy tracks. This integration is strictly one-way:

> **CommunityOS is the optional consumer. CovenantOS is the optional provider. CovenantOS does not depend on CommunityOS.**

CovenantOS has no imports from, no runtime dependencies on, and no schema coupling with CommunityOS. It remains a standalone product that can be surfaced inside a CommunityOS experience without inheriting CommunityOS operational ownership.

---

## Ownership split

| Concern | Owner | Notes |
|---|---|---|
| Academy tracks, intro-card lifecycle, permissions, and operational flows | CommunityOS | CovenantOS does not own or mutate these surfaces |
| Formation frame content, covenantal language, and covenant practices | CovenantOS | May be rendered inside CommunityOS when explicitly requested |
| `frameOverride` extension point | CommunityOS | CommunityOS decides when and where the hook is available |
| Formation frame payload mapped to CommunityOS track keys | CovenantOS | CovenantOS supplies optional content only |

---

## The `frameOverride` hook

Homestead Academy tracks in CommunityOS have a `frameOverride` extension point on their intro card. By default, an Academy track opens with a standard intro card describing the track's operational focus (for example, a harvest or household skill). When a CovenantOS formation frame is available for that track and the user has opted into covenant formation, the default intro card is replaced with a Covenant-flavored card that situates the practical skill within a formation frame.

### How it works

1. CommunityOS defines an optional `frameOverride` key on an Academy track.
2. CovenantOS publishes formation frames that map to CommunityOS track keys.
3. When CommunityOS loads an Academy track, it checks whether a valid `frameOverride` is configured and whether the user has opted into CovenantOS framing.
4. If both conditions are met, CommunityOS renders the CovenantOS frame in place of — or above — the default intro card.

### What does not change

- No schema changes in CommunityOS are required.
- No schema changes in CovenantOS are required for the presentation contract itself.
- The hook is a pure content/presentation overlay — it does not alter business logic, data models, or permissions in either system.
- The override is strictly optional. CommunityOS functions identically without it.

---

## Failure and fallback behavior

- If no `frameOverride` is defined, CommunityOS shows its default Academy intro card.
- If the user has not opted into CovenantOS framing, CommunityOS shows its default Academy intro card.
- If CovenantOS content is unavailable, invalid, or cannot be rendered, CommunityOS shows its default Academy intro card.
- CovenantOS must not assume CommunityOS is present. CovenantOS should continue to function as a standalone app and content system.

This boundary fails closed to CommunityOS defaults rather than creating a broken Academy flow.

---

## Dependency direction (explicit)

```text
CommunityOS ──(optional consumer)──► CovenantOS
                                         │
                                         │  formation frames / `frameOverride` content
                                         ▼
                                  No reverse dependency
```

CovenantOS must never import from CommunityOS. If you find yourself adding a CommunityOS import to this repository, stop and reconsider — the integration direction is wrong.

---

## Why this design?

This design preserves CovenantOS's independence. CovenantOS is a standalone formational tool with users who may have no connection to homesteading or community market operations. Tight coupling would:

- Prevent CovenantOS from standing on its own
- Force CovenantOS release cycles to track CommunityOS operational changes
- Blur the philosophical/formational purpose of CovenantOS with CommunityOS operations

The `frameOverride` pattern keeps the seam clean: CommunityOS reaches out when it wants formation context; CovenantOS provides it without taking ownership of the Academy runtime.

---

## Supabase considerations

CovenantOS and CommunityOS share a Supabase project in production, which allows unified identity across both tools. However, the schema tables are distinct and the application-layer contract does not rely on cross-product joins or reverse imports. The shared project is an operational convenience, not a product-boundary exception. See [`docs/SUPABASE.md`](SUPABASE.md) for details.

---

## Related

- [`docs/ARCHITECTURE.md`](ARCHITECTURE.md) — canonical architecture and ownership boundaries
- [`docs/SUPABASE.md`](SUPABASE.md) — shared-project data boundary
