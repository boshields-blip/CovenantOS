# Supabase

**Status:** Active | **Owner:** @boshields-blip | **Last updated:** 2026-07-15

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
└── 20260710_04_covenant_berean_sessions.sql
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

Future covenant tables may be added as the Diagnostic Engine and Language Module gain runtime support, but those additions must preserve the same product-boundary rules.
