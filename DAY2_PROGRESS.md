# Week 1 — Day 2: Database & Security

## Goal
Create the first database foundation for the Gym Management System using Supabase PostgreSQL.

## Completed
- Created `profiles` table for authenticated users and roles.
- Created `members` table for gym member records.
- Added indexes for member name and status.
- Enabled Row Level Security (RLS).
- Added Admin and Trainer access rules.
- Added an Admin seed script that uses a Supabase Auth user UUID.

## Technologies
- React 19 + Vite
- Tailwind CSS v4
- Supabase PostgreSQL
- Supabase Auth
- Supabase Row Level Security (RLS)
- Supabase JS Client v2
- TanStack Query
- Git + GitHub

## Files Added
```text
supabase/
├── migrations/
│   ├── 0001_create_profiles.sql
│   └── 0002_create_members.sql
├── policies/
│   └── 0001_profiles_members_rls.sql
└── seed_admin.sql
```

## Supabase Setup
1. Open the Supabase SQL Editor.
2. Run `0001_create_profiles.sql`.
3. Run `0002_create_members.sql`.
4. Run `0001_profiles_members_rls.sql`.
5. Create one user in Supabase Authentication.
6. Copy that user's UUID into `seed_admin.sql`.
7. Run `seed_admin.sql`.
8. Confirm that the user has role `admin` in `public.profiles`.

## Security
- `.env` must never be committed.
- RLS is enabled on every table created in Day 2.
- Admin can manage profiles and members.
- Trainer can view member records but cannot create, edit, or delete members through these policies.
- Role checks are performed in the database.

## Commit Message
`Day 2: Add profiles, members and RLS policies`

## Next Day
Build the Supabase Auth login page, fetch the user's role from `profiles`, and add protected routes.
