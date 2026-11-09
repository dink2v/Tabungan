-- Tabungan: schema Supabase (gunakan project Supabase KHUSUS Tabungan)
-- Auth tanpa form login: aplikasi memakai Supabase Anonymous Sign-In.
-- Aktifkan Anonymous Sign-Ins di Authentication > Providers sebelum mengaktifkan sinkronisasi.

create table if not exists public.tabungan_backups (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  payload jsonb not null,
  updated_at timestamptz not null default now(),
  constraint tabungan_backups_one_per_user unique (user_id)
);

alter table public.tabungan_backups enable row level security;

create policy "Users can read their own Tabungan backup"
on public.tabungan_backups for select
to authenticated
using ((select auth.uid()) = user_id);

create policy "Users can insert their own Tabungan backup"
on public.tabungan_backups for insert
to authenticated
with check ((select auth.uid()) = user_id);

create policy "Users can update their own Tabungan backup"
on public.tabungan_backups for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

grant select, insert, update on public.tabungan_backups to authenticated;

-- No policy for anon: unauthenticated/public access is intentionally denied.
