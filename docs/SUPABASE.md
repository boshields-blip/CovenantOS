# Supabase

**Status:** Draft  
**Owner:** @boshields-blip  
**Last updated:** 2026-06-12

---

## Shared project

CovenantOS and CommunityOS share a single Supabase project in production. This means:

- Users have a unified identity across both tools (one auth account works in CovenantOS and in CommunityOS's Homestead Academy, Market OS, and Wholesale OS)
- Row-level security (RLS) policies are defined per-table and enforce product-level isolation even within the shared project
- Migrations from both repositories land in the same database, and naming conventions must avoid collisions

**PlumbLineOS uses a separate Supabase project.** TradeCore (commercial plumbing/HVAC) clients share a database with each other but not with CovenantOS or CommunityOS users.

---

## No live credentials in this repository

Do not add Supabase credentials, API keys, service role secrets, or any live environment variables to this repository. All credentials are managed via GitHub Actions secrets and deployment environment configuration.

---

## Migrations layout

Migrations live in `supabase/migrations/`. Each migration file follows the naming convention:

```
YYYYMMDD_NN_short_description.sql
```

For example:
```
supabase/migrations/
├── 20260801_01_covenant_formation_groups.sql
├── 20260801_02_berean_tool_sessions.sql
└── ...
```

Migrations are applied in lexicographic order. Keep migration files small and focused — one concern per file.

---

## Schema conventions

- All CovenantOS tables are prefixed with `covenant_` to avoid collisions with CommunityOS tables in the shared project
- Row-level security is enabled on all tables
- Soft deletes (via `deleted_at` timestamp) are preferred over hard deletes for formation content
- Schema work has not yet begun; this file is a placeholder

---

## Upcoming schema work

The following tables are anticipated but not yet designed or migrated:

| Table | Purpose |
|---|---|
| `covenant_formation_groups` | Groups of users engaged in formation practices together |
| `covenant_berean_sessions` | Individual or group scripture/text examination sessions |
| `covenant_diagnostic_entries` | Logged belief diagnostics and pattern observations |
| `covenant_language_terms` | Community-defined covenantal vocabulary entries |
| `covenant_formation_records` | Logs of Come to the Table and Harvest and Hymn sessions |

Schema design will begin in Phase 2 after content migration from PlumbLineOS is complete.
