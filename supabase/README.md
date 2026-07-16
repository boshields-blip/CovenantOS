# Supabase

This directory contains Supabase migration files for CovenantOS.

## Migrations

Migration files live in `migrations/` and follow the naming convention `YYYYMMDD_NN_short_description.sql`. They are applied in lexicographic order. Each file should be small and focused on a single concern.

Current migrations define CovenantOS-owned schema for formation groups, formation records, workspace membership, and Berean sessions. See [`docs/SUPABASE.md`](../docs/SUPABASE.md) for the canonical data-boundary rules and schema conventions.

## Notes

- CovenantOS shares a Supabase project with CommunityOS in production, but ownership remains product-specific.
- All CovenantOS tables are prefixed with `covenant_` to avoid collisions.
- PlumbLineOS uses a separate Supabase project.
- Do not commit Supabase credentials or live environment variables to this repository.
