# Supabase

This directory contains Supabase migration files for CovenantOS.

## Migrations

Migration files live in `migrations/` and follow the naming convention `YYYYMMDD_NN_short_description.sql`. They are applied in lexicographic order. Each file should be small and focused on a single concern.

Schema work has not yet begun. Migrations will be added in Phase 2, after content migration from `boshields-blip/PlumbLineOS` is complete. See [`docs/SUPABASE.md`](../docs/SUPABASE.md) for the planned table structure and conventions.

## Notes

- CovenantOS shares a Supabase project with CommunityOS in production. All CovenantOS tables are prefixed with `covenant_` to avoid collisions.
- Do not commit Supabase credentials or live environment variables to this repository.
