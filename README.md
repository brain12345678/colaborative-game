# colaborative-game

**biggest contributor: brian**

This project now includes a lightweight Supabase-backed multiplayer layer for the lobby and room state.

## Enable online rooms

1. Create a Supabase project.
2. Create a public table named `game_rooms` with the SQL from [supabase-schema.sql](supabase-schema.sql).
3. Open the page with your project URL and anon key, for example:

   `index.html?supabaseUrl=https://YOUR_PROJECT.supabase.co&supabaseAnonKey=YOUR_ANON_KEY`

4. Optionally, define them globally before the page loads:

   ```html
   <script>
     window.ATOLL_SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
     window.ATOLL_SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
   </script>
   ```

If the credentials are missing, the game falls back to local browser storage so the single-player experience still works.

## What changed

- The lobby now saves room data to Supabase instead of relying only on browser storage.
- Open rooms can be shared across browser tabs and devices using the same room code.
- Realtime subscriptions keep the lobby roster up to date when another player joins or leaves.
