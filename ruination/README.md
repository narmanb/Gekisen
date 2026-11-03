# Dragonball Ruination – single-player Godot port

This folder holds the original BYOND source in `source/` and a Godot 4.3 remake of it in
`godot/`. The remake builds into an Android APK, and the same project can be exported to
Windows, Linux, macOS, iOS or the Web.

## What was carried over

All data is converted from the original files by the scripts in `tools/`. Nothing was
redrawn by hand.

| Area | Source | Notes |
|---|---|---|
| Sprites | all 654 `.dmi` files, including 87 in the old pre-4.0 format | `tools/export_icons.py` → `godot/icons/` |
| World | `DBZ_Ruination_Map.dmm`: 12 levels of 500×500 tiles | Every turf, object, NPC and monster stays where it was placed. 82 passage warps and the safe zones are included. |
| Races | `New Login Crim.dm`, `Powerlevel_Birth.dm` | 20 races. Each has its starting skills, stat multipliers and genes, plus the gene bonuses. |
| Techniques | `Learn Skills.dm` (Skill_Gain), `Techniques*.dm`, `ProjectilesJustin.dm` | 149 techniques and a 159-entry race/gene/level learn table. Projectiles use the original damage coefficients, ki-cost formula and cooldowns. |
| Transformations | `Transformations/*.dm` | Level requirements and stat multipliers for each race and gene. Super Saiyan hair and auras are shown. |
| Rules | `AttackNormal`, `Monster AI`, `Self Train`, `Meditate_Gain`, `Rest_Gain`, `Level_Up`, `Exp_Check`, `calcmaxpl` | Melee damage with dodge, block, counter and crits. Skill levelling works like the original: 13 skills, each up to 100. Modes (Super Easy → Godly) raise the exp needed per level. Fatigue is in. Ki Control caps your usable power. |
| Monsters and NPCs | `/mob/Monster/*`, `/mob/NPC/*` | Original stats and exp/zenni rewards. Monsters aggro within 12 tiles, respawn, and stay out of safe zones. NPCs say lines taken from their original dialogue. |

### Added for this version
* **MMO-style hotbar.** It has 3 bars of 10 slots. Every action (Attack, Self Train,
  Meditate, Rest, Transform, Travel…) and every technique you learn can go on it. Open
  **Skills**, tap something, then tap a slot. Hold a slot to clear it. New techniques are
  added to empty slots automatically.
* **Touch controls.** There's a joystick, a big Attack button and the hotbar. On a
  keyboard: arrows/WASD to move, 1–0 for slots, Space to attack, Tab to change bar,
  K for skills, C for stats.
* **Travel (space pod).** It takes you to any planet. The list shows the recommended
  level for each, worked out from the monsters placed there.
* **Saving.** The game auto-saves every 30 s and when the app is paused, to
  `user://ruination_save.json`.

### Left out (multiplayer or still to do)
Multiplayer, PvP, guilds, chat, admin tools, the bank, shops and items, quests, dungeons,
gravity rooms, fusion and Oozaru details. About 70 techniques with complex DM logic are
grouped into general behaviours: volleys, area blasts, binds, strikes, buffs, heals and
utilities. The rest are faithful projectiles.

## How to play
1. Make a character: pick a race, then a gene, then your look and name. You start in the
   Capsule City hospital, which is a safe zone.
2. **Self Train** to level up and **Rest** when your fatigue bar is full. **Training
   Focus** chooses which stat Self Train raises and which skill Meditate trains.
   **Meditate** on Ki Control to raise your usable power.
3. At **level 2,000** you can use battle techniques and monsters start hunting you. Use
   **Travel** to fly to Earth: Green Saibamen (level 10,000) are a good first target.
4. Techniques unlock at the original levels (Kamehameha at 3,000, …). Transformations
   unlock from level 20,000, depending on your race and gene.

## Building

```bash
# regenerate the data from the BYOND source (Python 3 + Pillow)
python3 ruination/tools/export_icons.py
python3 ruination/tools/build_world.py
python3 ruination/tools/build_rules.py

# play: open ruination/godot in Godot 4.3, or
godot --path ruination/godot

# Android APK, no Android SDK needed (Godot 4.3 + its export templates + a JDK)
GODOT=/path/to/godot ruination/tools/build_apk.sh
# -> ruination/godot/build/DragonballRuination.apk (Android 7.0+)

# automated smoke test (creates a character, trains, fights, transforms; takes screenshots)
godot --path ruination/godot -- --autotest --shots=/tmp/shots
```

The APK is signed with the bundled hobby key `tools/ruination-release.keystore` (password
`ruination`), so new builds install over old ones. The GitHub workflow
`.github/workflows/ruination.yml` builds the APK on every push and publishes it as a
release.

Most of the code is in `godot/scripts/`:
* `game.gd`: rules
* `ui.gd`: UI and hotbar
* `world.gd`: map renderer
* `data.gd`: data loading
