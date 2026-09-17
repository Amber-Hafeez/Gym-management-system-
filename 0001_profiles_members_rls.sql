-- Week 1 Day 2
-- Row Level Security for profiles and members.
-- Rule: Admin has full access. Trainer can view members but cannot manage users/roles.

alter table public.profiles enable row level security;
alter table public.members enable row level security;

-- Helper function used by policies to read the current user's role.
create or replace function public.get_my_role()
returns text
language sql
stable
security definer
set search_path = public
as $$
  select role
  from public.profiles
  where id = auth.uid();
$$;

revoke all on function public.get_my_role() from public;
grant execute on function public.get_my_role() to authenticated;

-- Profiles
drop policy if exists "profiles_select_authenticated" on public.profiles;
create policy "profiles_select_authenticated"
on public.profiles
for select
to authenticated
using (id = auth.uid() or public.get_my_role() = 'admin');

drop policy if exists "profiles_insert_admin" on public.profiles;
create policy "profiles_insert_admin"
on public.profiles
for insert
to authenticated
with check (public.get_my_role() = 'admin');

drop policy if exists "profiles_update_admin" on public.profiles;
create policy "profiles_update_admin"
on public.profiles
for update
to authenticated
using (public.get_my_role() = 'admin')
with check (public.get_my_role() = 'admin');

drop policy if exists "profiles_delete_admin" on public.profiles;
create policy "profiles_delete_admin"
on public.profiles
for delete
to authenticated
using (public.get_my_role() = 'admin');

-- Members
drop policy if exists "members_select_staff" on public.members;
create policy "members_select_staff"
on public.members
for select
to authenticated
using (public.get_my_role() in ('admin', 'trainer'));

drop policy if exists "members_insert_admin" on public.members;
create policy "members_insert_admin"
on public.members
for insert
to authenticated
with check (public.get_my_role() = 'admin');

drop policy if exists "members_update_admin" on public.members;
create policy "members_update_admin"
on public.members
for update
to authenticated
using (public.get_my_role() = 'admin')
with check (public.get_my_role() = 'admin');

drop policy if exists "members_delete_admin" on public.members;
create policy "members_delete_admin"
on public.members
for delete
to authenticated
using (public.get_my_role() = 'admin');
