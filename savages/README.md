# DBZ Savages – single-player Godot port

> **Archived.** Dragonball Ruination (`ruination/`) is the main game in this repo. This port is kept as it is and only builds when its workflow is started by hand.

`source/` holds the original BYOND project (Zeta.dme, by DragonSlayer4000, 2002–2004).
`godot/` is a Godot 4.3 remake of it. The remake builds into an Android APK, and the same
project can be exported to Windows, Linux, macOS, iOS or the Web. The player save files and
logs from the original server were left out.

## What was carried over

| Area | Source | Notes |
|---|---|---|
| Sprites | 168 `.dmi`/`.bmp` files, most in the old pre-4.0 DMI format | `tools/export_icons.py`. BMP buildings get their grey backdrop keyed out. |
| World | `map.dmp`: 20 levels of 150×150 tiles | Every turf, object and NPC in place. Doors, gyms, the Mall, the Lookout, the Time Chamber and the map-edge transitions all work (`tools/build_world.py`). |
| Character creation | `new_char_handling.dm` | 8 races, plus the 1-in-75 Buu Demon roll. Skin, 7 hair styles with RGB hair dye, facial hair, Nameks' skin and the Bio-Android types. Alignment, warrior class roll (Peasant → Legend), fighting style and face icon. |
| Training | `punchcheck`/`kickcheck`/`kicheck`, `Lift`, `Punch1`, Punching Contest, Meditation Pad, `playergravity`, `meditate`/`Resting`/`Healing` | Same gains and timings as the original: dummies, weights, speed bags, punching machines, meditation pads and the gravitron (10x–500x). |
| Levels | `Levelup`, `BattlePointDistribution` | Each level gives 6 battle points to spend on Strength, Defense or Speed, plus health, 5 max powerlevel and zenni. |
| Techniques | `skills.dm`, `objs.dm`, the NPC `Learn` verbs | 24 techniques. Ki beams spend the Ki you charge and deal Ki ÷ DEF. Fly, Ki Tech, Aura and Focus unlock at 100/150/375/425 max powerlevel. Mentors (Kame, Krillin, Gohan, Piccolo, Vegeta, Guadil, Dr. Gero, Kolan, Goku, Death) teach at the original stat requirements. |
| Transformations | `/obj/ssj`, `/obj/transform`, `/obj/celltransform`, `/obj/Mystic`, `FormTwo`/`SSJ`/`SNJ` | Enrage awakens a race's first form. Then SSJ → USSJ → SSJ2 → SSJ3 → SSJ4, the Changling and Cell forms, Super Namek, Mystic (Elder Kaioshin), Majin and Unlock Potential. |
| Combat | `Attack1`, `KO`, `Die`, monster `LifeCycle` | Saibamen, Raditz, Vegeta and Buu with their original health, strength and rewards. |
| Afterlife | `Die`, Kinjin, Snake Way, King Kai, Bubbles, Kaioshin | When a boss finishes you off, you wake up dead with a halo. Good souls take Snake Way and evil ones fall to Hell. Catch Bubbles, then King Kai sends you back and teaches Kaioken, Spirit Bomb and Instant Transmission. |
| Shops | Shopkeepers, Android 16, Barber, Videl, Dende, the space pods | Senzu beans, gis and armour (worn as overlays), haircuts and dye, aura colour, healing, and the space pod between Earth and Namek. |

### Added for this version
* **Touch controls, hotbar and action panel**, the same as in the Ruination port. Ki beams
  use a **Ki Charge** setting (25/50/75/100% of your Ki) instead of typing an amount.
* **Single-player monsters.** Saibamen, Raditz, Vegeta and Buu spawn at or near their
  original spawn points and respawn after they die. In the original they mostly came from
  admins or machines.
* **Death.** In the original, other players finished you off. Here, a boss (anything but
  a saibaman) does it when it knocks you out.

### Left out
PvP and sparring between players, the tournament, clans, the bank, fusion earrings,
scouter scans, Create, dragon balls and Shenron. Sparring stances aren't needed for the
speed bags.

## Building

```bash
python3 savages/tools/export_icons.py
python3 savages/tools/build_world.py
GODOT=/path/to/godot savages/tools/build_apk.sh     # -> savages/godot/build/DBZSavages.apk
godot --path savages/godot -- --autotest --shots=/tmp/shots   # smoke test with screenshots
```

The APK is signed with the bundled hobby key `tools/savages-release.keystore` (password
`savages`). `.github/workflows/savages.yml` builds it on every push and publishes it as
a release.
