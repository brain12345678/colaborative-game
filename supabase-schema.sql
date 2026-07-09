create table if not exists public.game_rooms (
  id text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

-- Turn off Row Level Security restriction blockers for this room matchmaking setup
alter table public.game_rooms enable row level security;

create policy if not exists "Allow all reads and writes to game_rooms"
  on public.game_rooms
  for all
  using (true)
  with check (true);

-- CRITICAL FIX FOR ONLINE MULTIPLAYER: 
-- Instructs Supabase to stream inserts/updates on this table live over WebSockets
alter publication supabase_realtime add table public.game_rooms;
