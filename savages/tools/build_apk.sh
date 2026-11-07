#!/bin/sh
# Build the Android APK of the Godot port (no Android SDK needed).
#
#   GODOT=/path/to/Godot_v4.3-stable_linux.x86_64 savages/tools/build_apk.sh
#
# Requirements: Godot 4.3 with its export templates installed
# (~/.local/share/godot/export_templates/4.3.stable/android_release.apk), a JDK, python3.
# Output: savages/godot/build/DBZSavages.apk
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
PROJ="$HERE/../godot"
GODOT="${GODOT:-godot}"
CACHE="$HERE/.cache"
mkdir -p "$CACHE" "$PROJ/build"

APKSIG="${APKSIG:-$CACHE/apksig.jar}"
if [ ! -f "$APKSIG" ]; then
  curl -sSfL -o "$APKSIG" https://repo.maven.apache.org/maven2/com/android/tools/build/apksig/2.3.0/apksig-2.3.0.jar
fi

# Godot refuses to export without an Android SDK path, even for an unsigned APK built from
# the prebuilt template. Give it a stub SDK (nothing in it is executed).
SDK="$CACHE/stub-sdk"
mkdir -p "$SDK/platform-tools" "$SDK/build-tools/34.0.0" "$SDK/cmdline-tools/latest/bin"
for f in platform-tools/adb build-tools/34.0.0/apksigner cmdline-tools/latest/bin/sdkmanager; do
  printf '#!/bin/sh\nexit 0\n' > "$SDK/$f"
  chmod +x "$SDK/$f"
done
CFG="${XDG_CONFIG_HOME:-$HOME/.config}/godot"
mkdir -p "$CFG"
JAVA_HOME_GUESS="${JAVA_HOME:-$(dirname "$(dirname "$(readlink -f "$(command -v javac)")")")}"
cat > "$CFG/editor_settings-4.3.tres" <<EOF
[gd_resource type="EditorSettings" format=3]

[resource]
export/android/android_sdk_path = "$SDK"
export/android/java_sdk_path = "$JAVA_HOME_GUESS"
EOF

"$GODOT" --headless --path "$PROJ" --import
"$GODOT" --headless --path "$PROJ" --export-release Android "$PROJ/build/DBZSavages-unsigned.apk"
sh "$HERE/sign_apk.sh" "$PROJ/build/DBZSavages-unsigned.apk" "$PROJ/build/DBZSavages.apk" "$APKSIG"
ls -la "$PROJ/build/DBZSavages.apk"
