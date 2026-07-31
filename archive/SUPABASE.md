# Supabase

**Status:** Active | **Owner:** @boshields-blip | **Last updated:** 2026-07-16

---

## Shared project

CovenantOS and CommunityOS share a single Supabase project in production. This means:

- Users can have a unified identity across both tools
- Row-level security (RLS) is enforced per table
- Migrations from both repositories land in the same database, so naming must remain product-specific

**PlumbLineOS uses a separate Supabase project.** TradeCore (commercial plumbing/HVAC) data does not share a project with CovenantOS or CommunityOS.

The shared Supabase project is a deployment detail, not a license to blur product ownership. Shared identity is allowed; reverse imports, cross-product write paths, and application-layer coupling are not.

---

## No live credentials in this repository

Do not add Supabase credentials, API keys, service role secrets, or any live environment variables to this repository. All credentials are managed via GitHub Actions secrets and deployment environment configuration.

---

## Current migrations layout

Migrations live in `supabase/migrations/`. Each migration file follows the naming convention:

```text
YYYYMMDD_NN_short_description.sql
```

Current migrations:

```text
supabase/migrations/
├── 20260710_01_covenant_formation_groups.sql
├── 20260710_02_covenant_formation_records.sql
├── 20260710_03_covenant_workspace_members.sql
├── 20260710_04_covenant_berean_sessions.sql
├── 20260716_05_covenant_forum.sql
├── 20260716_06_forum_3pane.sql
├── 20260716_07_covenant_invites.sql
├── 20260716_08_covenant_invite_auth_profile_alignment.sql
├── 20260716_09_covenant_teaching_shares.sql
└── 20260716_10_covenant_forum_roles_workspace_isolation.sql
```

Migrations are applied in lexicographic order. Keep migration files small and focused — one concern per file.

---

## Schema conventions

- All CovenantOS tables are prefixed with `covenant_` to avoid collisions with CommunityOS tables in the shared project
- Row-level security is enabled on all CovenantOS tables
- Product boundaries are enforced in application logic and policy design, even inside the shared project
- Prefer additive, focused migrations rather than large multi-concern changes

---

## Current CovenantOS schema surface

| Table | Purpose |
|---|---|
| `covenant_formation_groups` | Groups of users engaged in formation practices together |
| `covenant_formation_records` | Logs of Come to the Table and Harvest and Hymn sessions |
| `covenant_workspace_members` | Membership and access for covenant workspaces |
| `covenant_berean_sessions` | Individual or group scripture/text examination sessions |
| `covenant_forum_roles` | Per-user forum role assignments (reader/responder/teacher/elder/admin) |
| `covenant_forum_posts` | Reflection papers, questions, and discussion threads |
| `covenant_forum_replies` | Forum replies, restricted to elevated roles |
| `covenant_invites` | Pending covenant-lane invite tokens |
| `lane_memberships` | Per-(user, owner, lane) membership (shared infra, covenant lane) |
| `covenant_teaching_shares` | Shareable links for covenant teaching content |

> **Pending:** `covenant_forum_roles` has a planned PK redesign from `(user_id)` to `(user_id, workspace_id)`. This will be applied in a future migration once all existing rows have a non-null `workspace_id` (tracked as a shared infra/schema repo phase item). Until then, use the `covenant_forum_roles_null_workspace_inventory` audit view to monitor unassigned rows.

Future covenant tables may be added as the Diagnostic Engine and Language Module gain runtime support, but those additions must preserve the same product-boundary rules.
