# Architecture Alignment Audit

**Status:** Completed | **Owner:** @boshields-blip | **Last updated:** 2026-07-15

---

## Findings matrix

| Issue | Doc(s) | Fix |
|---|---|---|
| Canonical ownership docs were implied but not explicitly ranked | `README.md`, `docs/ARCHITECTURE.md`, `docs/INTRODUCTION.md` | Added a source-of-truth map and explicit authority order |
| Some docs still described CovenantOS as a future PlumbLineOS scaffold | `covenant_os/README.md`, `covenant_os/02_diagnostic_engine/README.md` | Reframed the content tree as current CovenantOS-owned content and removed stale scaffold wording |
| Broken architecture links remained inside the content tree | `covenant_os/README.md`, `covenant_os/02_diagnostic_engine/README.md`, `covenant_os/03_berean_tool/README.md`, `covenant_os/04_language_module/README.md` | Updated links to point at `docs/ARCHITECTURE.md` and `docs/INTRODUCTION.md` |
| CommunityOS integration language described the seam but not the owner/fallback split clearly enough | `docs/INTEGRATION_WITH_COMMUNITY_OS.md`, `docs/ARCHITECTURE.md`, `README.md` | Added ownership split, contract wording, and explicit fallback behavior |
| PlumbLineOS cutover docs used transitional "this PR / PR2" wording that could go stale | `MIGRATION_FROM_PLUMBLINEOS.md`, `docs/PR3_PLUMBLINEOS_CUTOVER.md` | Marked them as transitional docs and normalized wording around current ownership and pending tombstones |
| Supabase docs still claimed schema work had not started | `docs/SUPABASE.md`, `supabase/README.md` | Replaced placeholder language with current migration inventory and boundary rules |

---

## Canonical source-of-truth list

- [`docs/ARCHITECTURE.md`](./ARCHITECTURE.md) — canonical ownership boundaries, layer rules, runtime responsibilities, and handoff behavior
- [`docs/INTEGRATION_WITH_COMMUNITY_OS.md`](./INTEGRATION_WITH_COMMUNITY_OS.md) — canonical CommunityOS integration contract
- [`docs/SUPABASE.md`](./SUPABASE.md) — canonical shared-project and data-boundary rules
- [`../MIGRATION_FROM_PLUMBLINEOS.md`](../MIGRATION_FROM_PLUMBLINEOS.md) — transitional migration ledger
- [`docs/PR3_PLUMBLINEOS_CUTOVER.md`](./PR3_PLUMBLINEOS_CUTOVER.md) — transitional PlumbLineOS tombstone and redirect checklist
- [`../README.md`](../README.md) and [`docs/INTRODUCTION.md`](./INTRODUCTION.md) — orientation docs that defer to the canonical architecture docs above

---

## Terminology normalization summary

- Use **CovenantOS** for the product/repository name.
- Use **`covenant_os/` content tree** for the markdown-first layer content.
- Use **PlumbLineOS / TradeCore** only for commercial plumbing/HVAC ownership.
- Use **CommunityOS** only for homestead, market, wholesale, MeshCore, and Academy operational ownership.
- Use **`frameOverride`** for the optional one-way CommunityOS consumer contract.
- Use **tombstone redirect** for PlumbLineOS's post-cutover route behavior.

---

## Residual follow-ups / questions

- Mirror the same owner/fallback wording in the parallel PlumbLineOS and CommunityOS architecture audits so the three repositories use the same boundary language.
- If CommunityOS formalizes a stronger `frameOverride` payload contract later, document that contract in CommunityOS first and then link to it here rather than duplicating runtime ownership.
