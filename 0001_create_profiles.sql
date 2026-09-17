-- Week 1 Day 2
-- Create user profiles with application roles.
-- Authentication is handled by Supabase Auth.

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  role text not null default 'trainer'
    check (role in ('admin', 'trainer')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.profiles is 'Application profile and role for each authenticated user.';
comment on column public.profiles.role is 'Allowed roles: admin or trainer.';
