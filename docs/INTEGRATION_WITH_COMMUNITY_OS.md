# Relationship to CommunityOS

**Status:** Draft | **Owner:** @boshields-blip | **Last updated:** 2026-08-01

---

## Purpose

This document defines the boundary between CovenantOS and CommunityOS. The two are related but distinct systems, and this separation is intentional and should be preserved by anyone contributing to either.

---

## CovenantOS is informational and formational only

CovenantOS is a static, interactive web experience for covenantal formation. It exists to help someone re-see how scripture, household economics, and social life interconnect — through The Word, The Household, and The Compact. Its purpose is to form imagination, not to manage participation.

CovenantOS has no backend, no accounts, no forms, no bookings, no listings, and no transactional logic in its target architecture, and it should stay that way. It does not tell you how to reserve the venue, sign up for a market stall, or coordinate a shared harvest. It tells you why those things matter and what covenantal frame they sit inside.

---

## CommunityOS is the operational layer

CommunityOS is the separate system responsible for how people actually interact with shared spaces and local commerce. This includes:

- The Commons — the community market and food commons being developed
- Aletheia Farm — the working farm and event venue
- Coordination of shared spaces, market participation, vendor logistics, and event scheduling

CommunityOS is where interaction, transactions, bookings, and operational logistics belong. It is out of scope for this repository.

---

## How the two relate

CovenantOS explains the why. CommunityOS handles the how.

A person who walks through The Word, The Household, and The Compact should come away understanding the covenantal logic behind household stewardship, honest trade, and shared commons — and should be able to see Aletheia Farm and The Commons named as real, lived instances of that logic, not abstractions. CovenantOS may describe and reference Aletheia Farm and The Commons directly in its content. What it must not do is absorb their operational functions — no market calendars, no vendor sign-up, no venue booking, no account system to track participation.

Where a reader is ready to move from formation to participation, CovenantOS points outward — a simple, static reference to CommunityOS — rather than building that functionality itself.

If CommunityOS chooses to surface CovenantOS framing through a one-way `frameOverride` hook, CommunityOS remains the consumer and runtime owner. CovenantOS must not import from, depend on, or reference CommunityOS internals.

---

## Why this boundary matters

Collapsing the two systems would pull CovenantOS away from its no-backend, content-first design and toward the kind of platform behavior — accounts, transactions, managed state — that the project's design principles explicitly reject. Keeping them separate lets CovenantOS stay simple, durable, and easy to maintain as pure content, while CommunityOS can evolve independently to meet the practical needs of running a market, a farm, and a shared commons.

---

## Related documents

- [`docs/ARCHITECTURE.md`](./ARCHITECTURE.md) — CovenantOS target architecture
- [`docs/DESIGN_PRINCIPLES.md`](./DESIGN_PRINCIPLES.md) — no-backend and content-first principles
- [`modules/02_the_household/README.md`](/the-household) — household stewardship, embodied at Aletheia Farm
- [`modules/03_the_compact/LOCAL_MARKET_AND_SOCIAL_FABRIC.md`](/the-compact/local-market-and-social-fabric) — local trade, embodied at The Commons
