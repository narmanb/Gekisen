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
| Appearance | `Choose_Base`, `CreateChar`, `ApplyIconHair`, the `*_Multi` procs | Only Humans, Saiyans, Half Saiyans and Androids pick a skin and hair on the human base; Androids can also be Gluttonous (Android 21). Every other race uses its own sprite, and genes swap it where the original does (Hitman, Pride Trooper, Yardrat, Moro, Kamenian, Rebrianne, the three Lycanthropes, Cooler/King Cold, Zealot Kai, Janemba, Fomhoire (hair only from its third form), Universe 2 Tuffle, Roshi). Bio Android picks a colour, Feline picks Destructive or Chaotic. |
| Rules | `AttackNormal`, `Monster AI`, `Self Train`, `Meditate_Gain`, `Rest_Gain`, `Level_Up`, `Exp_Check`, `calcmaxpl` | Melee damage with dodge, block, counter and crits. Skill levelling works like the original: 13 skills, each up to 100. Modes (Super Easy → Godly) raise the exp needed per level. Fatigue is in. Ki Control caps your usable power. |
| Monsters and NPCs | `/mob/Monster/*`, `/mob/NPC/*` | Original stats and exp/zenni rewards. Monsters aggro within 12 tiles, respawn, and stay out of safe zones. NPCs say lines taken from their original dialogue. |

### Added for this version
* **MMO-style hotbar.** It has 3 bars of 10 slots. It starts with just Ki Blast, and new
  battle techniques are added to empty slots automatically. Any action or technique can go
  on it: open **Skills**, tap something, then tap a slot. Tap **Cancel placing** (or close
  the book) to back out. Hold a slot to clear it.
* **Action panel.** The round buttons above the Attack button hold Talk, Self Train,
  Meditate, Rest, Transform and Revert, plus Fly, Power Up, Sense and Instant Transmission
  once you learn them. A button lights up while it is active.
* **Message window.** Training stat ticks (Powerlevel +X, Ki +X, Strength +X, Training
  points, skill exp) are listed like the original's second output pane: red when boosted.
  Drag it by its title bar, resize it from the corner, minimise it, and switch between a dark
  panel, a clear (no background) look and the old fading overlay. Tabs: All, Ticks, Combat
  and Gains (what you've gained this session, with rates per hour). It remembers its layout.
* **Minimap.** Tap it to enlarge; Menu turns it on or off.
* **Full stats screen.** Every stat, all 13 skills with their exp, multipliers, active
  effects and transformations.
* **Dragon hotbar.** A Shenron-themed bar with 9 slots per page (3 pages); tap the dragon
  ball on its back to switch pages. Side buttons are dragon balls, named underneath, and only appear once you
  have that ability (Transform when a form is unlocked, Revert while transformed, Fly,
  Power Up, Power Down, Sense, Instant Transmission). The **Train** button at the top opens
  Self Train, Meditate, Rest and Training Focus.
* **Touch controls.** There's a joystick, a big Attack button and the hotbar. On a
  keyboard: arrows/WASD to move, 1–0 for slots, Space to attack, Tab to change bar,
  K for skills, C for stats.
* **Gravity rooms.** The gravity building on Earth (next to the Gravity Training
  Enthusiast) has the original 100x, 200x, 300x and 500x machines. Talk to a machine to
  turn it on. Every pull drains some powerlevel, but Self Train gives more exp, TP and stat
  gains, and Meditate gives double skill exp. The rules come from `System/Gravity.dm`.
* **Saving.** The game auto-saves every 30 s and when the app is paused, to
  `user://ruination_save.json`.

### Left out (multiplayer or still to do)
Multiplayer, PvP, guilds, chat, admin tools, the bank, shops and items, quests, dungeons,
space travel, fusion and Oozaru details. About 70 techniques with complex DM logic are
grouped into general behaviours: volleys, area blasts, binds, strikes, buffs, heals and
utilities. The rest are faithful projectiles.

## How to play
1. Make a character: pick a race, then a gene, then your look (if that race has choices) and name. You start in the
   Capsule City hospital, which is a safe zone.
2. **Self Train** to level up and **Rest** when your fatigue bar is full. **Training
   Focus** chooses which stat Self Train raises and which skill Meditate trains.
   **Meditate** on Ki Control to raise your usable power.
3. At **level 2,000** you can use battle techniques and monsters start hunting you. Use
   Leave the hospital through its exit to reach Earth. Green Saibamen (level 10,000) are
   a good first target.
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
