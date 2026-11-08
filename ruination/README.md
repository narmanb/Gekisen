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
* **Action panel.** The dragon balls above the Attack button are, in this order: Rest, Talk,
  Fly, Power Up, Power Down, Transform, Revert. Rest and Talk are always there; the others show
  up once you know them (Transform once your next form is unlocked, Revert while transformed).
  A button lights up while it is active.
* **Teachers.** Talk to them to learn their techniques, as in `Mobs/*.dm`: Goku (After Image,
  4,000), SSJ3 Goku (Dragon Fist, 10,000), SSJ4 Goku (X10 Kamehameha, 10,000), Vegeta (Galick
  Gun 20,000; Saiyans: Final Flash 32,000, Big Bang 40,000, Prideful: Final Shine 40,000),
  Piccolo (Zanzoken 12,500, Light Grenade 20,000, Namekians: Special Beam Cannon 25,000), Tien
  (Solar Flare 7,500, Split Form 15,000, Tri Beam 25,000), Trunks (Finish Buster 25,000, Half
  Saiyans: Burning Attack 40,000), Yardrat Sensei (Instant Transmission, 750), Frieza
  (Changelings: Death Beam), Dr. Gero (Androids: SS Deadly Bomber, 40,000).
* **Techniques follow the original code.** Blasts deal (PL*a + Ki*b) * Ki Power% minus the
  target's ki defence * ki resistance%, and splash blasts explode over a square of tiles
  (`splashrange` 1 = 3x3) for their splash damage minus 40% of defence, also when they hit a
  wall or run out of range. Triple Ki Blasts fire three at once (front and both sides). Rapid
  Blast, Ki/Flame Shower, Shine Missile, Hell Zone Grenade, Acid Rain and Genocide fire homing
  ki missiles; Trace Nuke homes in too. Big Bang, Burning Attack, Blaster Shell and Revenge Death
  Ball are 3x3 balls. Explosive Wave hits everything within 3 tiles for half your powerlevel
  with a spreading ring of fire; Super Explosion Wave pulses out three times. Push hits the enemy
  in front for round(str*melee% - def*dur/150)*0.4 + level*15 and throws it 1-3 tiles; Power
  Dash charges up to 20 tiles leaving after-images and slams into the first enemy for
  round(str*melee% - def*dur%)*0.6 + level*15; Burst Rush (100,000 Ki) blinks to three sides of
  the enemy and throws it, leaving it stunned (it does no damage in the original). Monsters like
  Frieza's Henchmen have very high ki defence in the original, so blasts barely scratch them
  until your Ki and Ki Power are much higher; Saibamen, angels and demons take full damage.
* **Message window.** Training stat ticks (Powerlevel +X, Ki +X, Strength +X, Training
  points, skill exp) are listed like the original's second output pane: red when boosted.
  Drag it by its title bar, resize it from the corner, minimise it, and switch between a dark
  panel, a clear (no background) look and the old fading overlay. Tabs: All, Ticks, Combat
  and Gains (what you've gained this session, with rates per hour). It remembers its layout.
* **Minimap.** Tap it to cycle small / medium / large, drag it to move it; it remembers
  where you left it. Menu turns it on or off or resets its place.
* **Beams.** As in `ProjectilesJustin.dm`, a beam's head appears on the tile in front of you and
  leaves its trail sprite (`kamehamehat`, `masenkot`, ...) behind it. Diagonal beams turn the
  straight sprite 45° and stretch the trail pieces so the beam stays one line.
* **Instant Transmission** works like `Instant Transmittion.dm`: pick an NPC's energy signal,
  pay 500 Ki and stand still while you lock on (3 s, 1.5 s for Yardrats), then appear next to
  them. Not from Dr. Gero's Lab and beyond, and not with gravity on. Put it on the hotbar from
  Skills.
* **Transformations follow `Transformations/*.dm`.** Transform opens the original "Which form would
  you like to transform to?" menu with every form you qualify for (e.g. Saiyans get Form 3 instead
  of Form 2 once their Transformation level reaches 25). Namekians, Majins, Androids, Dragons and
  the other step races go one form further per press and their forms stack. Transforming takes
  5.1 s at first (faster as Transformation Speed rises) with lightning and an explosion ring;
  time in a form raises your Transformation level, which also boosts forms written as
  "x + trans_lvl/20". Staying transformed costs nothing, as in the original. Each race gets its
  own Big Aura (Menu can turn it off); Androids, Bio Androids, Hitmen and Zealots can't revert.
  Counters the port doesn't keep (Majin eats, Demon corrupts, Saibaman/Tuffle infects, Android
  chips, absorbs, assassin kills) count as met.
* **Sound.** The original Ruination only ships `aura full.wav` (played when Aura turns on) plus a
  jump sound and Konat's Tapion MIDI, so attacks use the sound set from Gekisen in this repo:
  punch/kick hits, ki blast and beam fire (Kamehameha, Special Beam Cannon, discs, Big Bang),
  explosions, teleport (Instant Transmission, Power Dash, Burst Rush), power up (also while
  transforming) and regenerate. Menu -> Sound On / Off.
* **Monster AI follows the original** (`Monster AI.dm`, `Monsters Peaceful.dm`, `ExplosiveSaibas.dm`,
  `ExplosiveCells.dm`, `beerus.dm`): sleep until you're within 12 tiles (16 in Gero's Lab and on
  Beerus' planet), chase a step every 0.2 s, attack every 1.1 s (Beerus mobs 2.6 s, % of your max
  powerlevel), lose you past 13 tiles; AttackMOB damage with monster criticals; exploding mobs
  glow and blow up (the corpse's blast hurts), give a level per kill; the Saibaman Boss spawns
  pawns; everything killed respawns together every 150 s. Saga bosses aren't in: in the original
  they only appear when an admin starts a saga, and their fighting AI is commented out.
* **Update notes.** Menu -> Update Notes lists everything added and fixed in this version
  (`godot/data/update_notes.txt`, newest first; add to it with every change). Legacy Update Notes
  shows the original game's own update log, extracted by `tools/build_notes.py`.
* **Test menu.** The **Test** button (top right) levels you up 1–5,000 times, refills you,
  teaches every technique your race can learn, and teleports you to any NPC, any enemy type
  or typed-in coordinates.
* **Full stats screen.** Every stat, all 13 skills with their exp, multipliers, active
  effects and transformations.
* **Dragon hotbar.** A Shenron-themed bar with 9 slots per page (3 pages); tap the dragon
  ball on its back to switch pages. Side buttons are dragon balls, named underneath, and only appear once you
  have that ability (Transform when a form is unlocked, Revert while transformed, Fly,
  Power Up, Power Down, Sense). The **Train** button at the top opens
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
