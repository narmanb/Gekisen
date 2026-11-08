# Notes for AI coding agents (Codex, Claude, etc.)

Read this before changing anything. The owner plays the game on Android and reviews by feel, so
match what's here instead of "improving" things on your own.

## What this repo is

- **`ruination/` is the game being worked on**: a single-player Godot 4.3 remake of the BYOND game
  *Dragonball Ruination*, built as an Android APK. Everything below is about it.
- `android-port/` (Gekisen), `savages/` and `dbo/` are **archived** ports. Don't touch them unless asked.
- The `.dm`/`.dmi` files in the repo root are the original Gekisen BYOND source. Leave them alone.
- `ruination/source/` is the **original Ruination BYOND source**. It's the reference for "how the
  original did it": DM code under `DBFT Programming/`, the UI in `Gold Glory.dmf`, the map in
  `DBZ_Ruination_Map.dmm`. Read it; never edit it.
- `ruination/README.md` documents every system and which original file it came from. Read it.

## Branch and git

- Work on `claude/byond-android-apk-conversion-s0nsu2` (or whatever branch the owner names). Don't
  push to `main`, and don't open pull requests unless asked.
- Pushing changes under `ruination/godot/**` triggers `.github/workflows/ruination.yml`. It builds the
  APK and publishes it as a GitHub prerelease, which is how the owner gets builds. Keep that workflow
  working.
- Never commit save files (`user://` data, `*.sav`, `players/` contents from other people), keystore
  passwords or other credentials.

## Layout of the Godot project (`ruination/godot/`)

- `scripts/game.gd`: autoload `Game`, almost all game logic: player dict `Game.P`, combat, training,
  levels, monsters and their AI, techniques/projectiles, transformations, sagas, teachers, rebirth,
  saving, server options.
- `scripts/ui.gd`: all UI (CanvasLayer, built in code, no .tscn layouts): character creation, stat
  points, hotbar, side buttons, menus, dialogs, stats screen.
- `scripts/world.gd` draws the map and mobs; `scripts/mob.gd` is the Mob class; `scripts/data.gd` is
  the autoload `Data` that loads `data/*.json`; plus `minimap.gd`, `logwindow.gd` and `main.gd`.
- `data/`:
  - `map.json`, `z*.bin`, `mobs.json`, `types.json`, `icons.json`, `rules.json` and `icons/` are
    **generated** by `ruination/tools/*.py` from the original source. Change the generator
    (`build_world.py`, `build_rules.py`, `export_icons.py`, then `make_custom_sprites.py`), not the
    JSON by hand, or the next rebuild will wipe your change.
  - `sagas.json` and `update_notes.txt` are **hand-written**; edit them directly.
  - `legacy_updates.txt` comes from `tools/build_notes.py`.
- `tests/autotest.gd` is an end-to-end test that plays through most systems and takes screenshots.
  `tests/balance.gd` simulates hours of play and prints growth curves.

## Rules the owner cares about

1. **Add an entry to `ruination/godot/data/update_notes.txt` with every change**: newest at the top,
   same format (`[color=#ffd75e][b]M/D/YYYY – Title[/b][/color]`, then `- ` lines). Write for players,
   in plain words. Also update `ruination/README.md` when a system changes.
2. **Stay faithful to the original** unless the owner asked for a change. Before you implement or
   "fix" a mechanic, find how `ruination/source` did it and say where (file and proc name).
3. **No homing attacks unless they're dodgeable.** Saga bosses' volleys fly at the spot you were
   standing on; stronger ones re-aim once or twice. The Dodge skill applies to homing shots and melee
   only, never to straight blasts or beams.
4. **The numbers are deliberately series-like** (after the numbers rework). Don't bring back the
   original's huge numbers. The constants live at the top of `game.gd` (`START_PL`, `LEVEL_WALL`,
   `K_TRAIN`, `K_LEVEL`, `K_KILL`, `ladder()`, `remap_level()`, `grow()`, `ratio_dmg()`,
   `level_tnl()`, `TEMP_FORM_MULT`, `PERM_FORM_MULT`, `MULTI_TOTAL`, `PERM_MULTI_TOTAL`).
   Agreed targets:
   - Starting powerlevel: Human about 50, Saiyan 150, Changeling 1,000.
   - Super Saiyan (level 400) comes after about 9–10 hours of AFK Self Train.
   - A billion powerlevel should be an accomplishment: about 250–300 hours AFK, about 90 hours mobbing.
   - Mobbing must stay clearly faster than AFK training.
   - Permanent (step) transformations stay stronger than temporary ones.

   If you touch balance, run the balance sim before and after and report both.
5. **Races are balanced**: every race and gene's built-in multipliers add up to 15, or 17 for races
   with permanent transformations. Each keeps its original shape (`_balance_multis`).
6. **Stat points** (original `SetMultis.dm` and the live `multis` window in `Gold Glory.dmf`):
   - 5 points, +1 per rebirth, on the Ki, Strength and Defense multipliers or Stamina. There is no
     Powerlevel button.
   - Each multiplier is capped at `10 + rebirths`, counting the race's base.
   - Points can't be taken out of the race's base.
7. **Server Options** (Exp, Zenni and Stat Gains %, default 100%) are stored apart from the save in
   `user://server_options.json`. Planned to become the multiplayer host's settings.
8. Old saves without `balance_v` are moved aside, not converted. Bump that version if you change the
   numbers again.
9. Touch controls only (phone). Keep every new screen usable at 1280x720 with big buttons, and make
   long text wrap.

## Testing (do this before every push)

You need Godot 4.3-stable for Linux (the workflow downloads it from the Godot GitHub releases) and,
for windowed runs, a virtual display:

```sh
Xvfb :99 &                                   # once
G=/path/to/Godot_v4.3-stable_linux.x86_64
cd ruination/godot
$G --headless --path . --import              # after adding or changing assets
DISPLAY=:99 timeout 300 $G --path . -- --autotest --shots=/tmp/shots   # must print "AUTOTEST OK"
$G --headless --path . -- --balance          # growth curves (also --mob-only, --multis)
```

- "Parse JSON failed" and ALSA/vsync errors in the autotest output are normal noise.
- `SCRIPT ERROR`, a failed `assert`, or a missing `AUTOTEST OK` means it's broken. Fix it; don't
  delete or weaken the test.
- Look at the screenshots for UI changes.
- When you add a feature, add a short check for it to `tests/autotest.gd`.
- APK locally (optional; CI does it on push): `GODOT=$G sh ruination/tools/build_apk.sh`, which needs
  Godot's 4.3 Android export templates and a JDK 17. Output: `ruination/godot/build/DragonballRuination.apk`.

## GDScript gotchas seen so far

- Godot 4.3 syntax: typed vars (`var x := ...`), `func(): ...` lambdas, multi-line `match` arms.
  Don't use Godot 3 APIs.
- Before you build a dialog that opens another dialog, check `dialog_panel`; otherwise you leave
  invisible copies behind.
- When you add a new popup panel, add it to `ui._modal_open()` and `minimap._blocked()` so taps don't
  fall through.
- For a control that needs to shrink, set `custom_minimum_size` before `size`.

## Planned work (don't start unless asked)

- Remaining NPCs and quests; tie sagas to quests.
- A soft cap tied to **rebirths** (not to sagas).
- Online multiplayer: any player can host, and anyone can join from Android, Windows, Linux or web.
  The host chooses bring-your-own saves or host-stored saves. Saves must work across platforms, so
  keep the save as plain JSON with no platform-specific data.
- Desktop and web exports.
