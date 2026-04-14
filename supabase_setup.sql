-- Run this in your Supabase SQL Editor
-- Table to store all CRM data as key-value pairs

create table if not exists crm_data (
  key         text primary key,
  value       text,
  updated_at  timestamptz default now()
);

-- Allow public read/write (protected by login in the CRM itself)
alter table crm_data enable row level security;

drop policy if exists "allow_all" on crm_data;
create policy "allow_all" on crm_data
  for all
  using (true)
  with check (true);
