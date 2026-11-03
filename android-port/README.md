# Gekisen – single-player Android port

This folder turns the original BYOND game in the repository root into a
single-player game that runs on Android (as an APK) and in any modern browser.

BYOND's DM language can't run on Android, so the game was rebuilt as an
HTML5/JavaScript engine. It uses the original game's **real data**:

* **Sprites**: all 590 `.dmi` icon files are converted. Most of them use the
  pre-2005 BYOND icon format, which isn't documented anywhere.
  `tools/legacy_dmi.py` decodes it (the format is described at the top of that
  file).
* **World**: the full `map.dmp`, which has 30 z-levels of 400×400 tiles, with
  every turf, object, NPC and monster in its original place, plus door/house
  warps from the turfs' `Enter()` procs.
* **Rules**: combat damage, ki blasts, training gains, meditation, resting, kill
  rewards, transformations (`/obj/Tran`), the 24-step saga quest chain
  (Raditz → Kid Buu) and the travel NPCs. All of these are ported from the DM
  code. The quest bosses, rewards and warps are pulled straight out of
  `battle_system.dm`.

Multiplayer, admin, guild, chat and anti-hack systems were left out.

## Installing on a phone

Every push that changes `android-port/` runs the **Build Android APK** GitHub
Actions workflow (`.github/workflows/android.yml`). It:

1. builds `Gekisen.apk`,
2. attaches it to the workflow run as an artifact, and
3. publishes it as a pre-release named `android-<branch>` on the repository's
   *Releases* page.

On your phone, open the release, download `Gekisen.apk` and open it. Android
will ask you to allow installs from this source. You can also start a build by
hand from the Actions tab (*Run workflow*).

The APK is signed with the bundled hobby keystore
(`android/gekisen-release.keystore`, password `gekisen`). Because every build
has the same signature, new versions install over old ones and your save is
kept. To sign with a private key instead, add these repository secrets:
`GEKISEN_KEYSTORE_B64` (the keystore, base64-encoded),
`GEKISEN_KEYSTORE_PASSWORD`, `GEKISEN_KEY_ALIAS` and `GEKISEN_KEY_PASSWORD`.

## Controls

| Touch | Keyboard | Action |
|---|---|---|
| Left stick | Arrows / WASD | Move (8 directions) |
| Attack (hold) | Space | Melee attack. Faces an adjacent enemy automatically. |
| Ki Blast | F | Fire a ki blast (uses ki) |
| Talk/Use | E | Talk to NPCs, train on equipment, enter saga battles |
| Power Up | P | Charge ki and power level (uses stamina) |
| Block | B | Take 1/5 damage |
| ☰ menu | M / R / T / Y | Meditate, rest, transform, fly; stats, saga hints, save |

The game auto-saves every 30 seconds and when the app is paused.

## How to play

You start in the training hall, as in the original. Lift weights and hit the
speed bags (stand on or next to them and press **Talk/Use**), or meditate. When
you're ready, talk to the Sensei to go out into the world.

Saibamen on Earth have 1,000 PL, so train first! Defeat monsters for max PL and
zenni, buy clothes from the shopkeepers, and follow the saga (☰ → *Saga* shows
where the next fight starts).

Each race unlocks four or five transformations at 300k, 1M, 5M and 10M max PL.
If you die you go to the Other World. Talk to King Yemma (or Baba) to come back.

## Rebuilding

```bash
# 1. regenerate game data from the BYOND sources (Python 3 + Pillow)
python3 android-port/tools/export_icons.py   # .dmi -> web/assets/icons + data/icons.json
python3 android-port/tools/build_data.py     # .dm + map.dmp -> data/*.json, data/z*.bin

# 2. play in a browser
cd android-port/web && python3 -m http.server 8000   # open http://localhost:8000

# 3a. build the APK with the Android SDK + JDK 17
cd android-port/android && ./gradlew assembleRelease
# -> app/build/outputs/apk/release/app-release.apk

# 3b. ...or without the Android SDK (only a JDK + three jars from Maven Central:
#     org.robolectric:android-all (saved as android-all.jar),
#     com.jakewharton.android.repackaged:dalvik-dx, com.android.tools.build:apksig (as apksig.jar))
python3 android-port/tools/build_apk_manual.py --libs path/to/jars --out Gekisen.apk
```

The game needs Android 7.0 (API 24) or newer.

## Layout

```
android-port/
  tools/      converters: legacy_dmi.py, export_icons.py, dmparse.py, build_data.py
  web/        the game (index.html, js/, css/, generated data/ and assets/)
  android/    WebView wrapper app (serves web/ from the APK's assets)
```
