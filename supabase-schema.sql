create table if not exists public.game_rooms (
  id text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.game_rooms enable row level security;

create policy if not exists "Allow all reads and writes to game_rooms"
  on public.game_rooms
  for all
  using (true)
  with check (true);
