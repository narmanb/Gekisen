# Dragonball Online v1.3 – single-player Godot port

`source/` holds the original BYOND project (Dragonball Online v1.3, by DBOTeam). `godot/` is a
Godot 4.3 remake that builds into an Android APK. The BYOND hub password in the original
source was blanked out.

## What was carried over

| Area | Source | Notes |
|---|---|---|
| Sprites | about 400 `.dmi` files | `tools/export_icons.py` |
| World | `Map.dmp`: 25 levels of 150×150 tiles | Every turf, object, NPC and monster placement. 50 warps (gyms, the bar, the Lookout, the Time Chamber, Gero's lab, ships, city edges) work (`tools/build_world.py`). |
| Creation | `char_handling.dm` | 9 races with their starting powerlevel, Ki, stamina and techniques. 13 hair styles and a hair colour, alignment (Good/Neutral/Evil) and 5 hometowns. You start immortal on Newbie Island; Intro 2 sends you home. |
| Training | `punchcheck`/`kickcheck`/`kicheck` and their dummy versions, `rest`, `meditate`, weights, punching bags, gravitrons | Same gains and timings. Training next to a Class I dummy gives 2× and a Class II dummy 4×. |
| Skill points | `Levelup`, Ki Trainers | Skill exp becomes skill points, spent on Ki Knowledge → Advanced → Ki Control → Ki Combat → Enhanced. Fly, Ki Blast/Beam/Zanzoken, Power Up/Sense and Focus/Enrage unlock at 100/600/1,100/1,600 max powerlevel. |
| Combat | `Punch`, `Kick`, `Block`, `TakeDamage`, `KO`, `Die`, `styles.dm` | Damage is a % of your powerlevel set by your combat stance. Monsters land 1 in 5 swings for 5–10% of theirs. You can't hit monsters on your own side. |
| Monsters | `monsters.dm` | All 89 monster types, from thugs and saibamen to the Saiyan, Frieza, Cell and Buu sagas, with their powerlevel, Ki and rewards (max PL, max Ki, skill exp, zenni). Evil ones hunt good players; the Z fighters hunt evil ones. |
| Techniques | `skills.dm`, teachers' `Learn` verbs | 28 techniques. Beams deal Ki × power × focus. Teachers (Kame, Piccolo, Vegeta, Tenshinhan, Yamcha, Trunks, Frieza, Guldo, Brolly, Goku, Yardrat, King Kai) charge the original skill points and requirements. |
| Transformations | `/obj/transes`, `SSJ()` | Super Saiyan (awakened by Enrage at 1.2M PL / 500K Ki) → USSJ → SSJ2 → SSJ3, Changeling forms 2–5 (Frieza), Cell forms, Buu forms, Super Human (Kame), Super Namek (Dende) and Super Android (Gero), with the original powerlevel requirements and multipliers. |
| Spells | `/obj/spells` | Wizards start with Immolation, Blind and Flame Shield; the Wizard NPC teaches Paralyze and Mind Control; Wizards and Buus can Shape Shift. Spells need full stamina, use it all, and have a cooldown, as in the original. Mind-controlled monsters fight for you for a minute. |
| Quests | `quests/quest.dm`, Guru, Nail, Dende | Guru's request (find Nail and Dende) and Unlock Potential once Frieza is beaten; Babidi's Ship, a floor per boss (Pui Pui, Yakon, Dabura, Majin Vegeta, Babidi, Buu) with the Reincarnation transformation at the bottom. Menu → Quests shows your progress. |
| Travel | `/obj/ccsp`, space consoles, `spacetravel`, time machine | Capsule Corp's space pods fly to Earth, Namek, Yardrat or New Vegeta. Bulma's time machine goes to the present, Trunks's timeline (the Cell Games) or Cell's timeline. (The original only had the present working; the other two timelines are my addition.) |
| Afterlife | `Die`, King Yemma, King Kai, Bubbles, Gregory | Dying takes you to the Other World. Yemma sends you to Snake Way, Hell or Heaven by alignment. King Kai's training (catch Bubbles and Gregory) brings you back to life. |

### Added for this version
* The touch controls, hotbar and action panel from the other ports. Beams use a Ki Charge
  setting instead of typing an amount.
* King Yemma can be talked to from a few tiles away, because his desk blocks the tiles
  next to him (the original used double-click).

### Left out
PvP, guilds, mail, tournaments, dragon balls, fusion, absorbing other players, custom
attacks, the bank and the HFIL (Goz and Mez) quest. Babidi's Ship stays where the map
puts it instead of wandering.

## Building

```bash
python3 dbo/tools/export_icons.py
python3 dbo/tools/build_world.py
GODOT=/path/to/godot dbo/tools/build_apk.sh      # -> dbo/godot/build/DragonballOnline.apk
godot --path dbo/godot -- --autotest --shots=/tmp/shots
```

Signed with the bundled hobby key `tools/dbo-release.keystore` (password `dragonball`).
`.github/workflows/dbo.yml` builds the APK on every push and publishes it as a release.
