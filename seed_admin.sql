-- Week 1 Day 2
-- Seed one Admin profile after creating the user in Supabase Auth.
--
-- STEP 1:
-- Supabase Dashboard -> Authentication -> Users -> Add user
-- Create an email/password user.
--
-- STEP 2:
-- Copy that user's UUID.
--
-- STEP 3:
-- Replace YOUR_AUTH_USER_UUID below and run this SQL.

insert into public.profiles (id, full_name, role)
values (
  'YOUR_AUTH_USER_UUID',
  'Gym Admin',
  'admin'
)
on conflict (id) do update
set full_name = excluded.full_name,
    role = excluded.role,
    updated_at = now();
