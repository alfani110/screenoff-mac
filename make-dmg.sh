#!/bin/zsh
# Builds the app, then packs it into build/ScreenOff.dmg with an Applications shortcut.
set -euo pipefail
cd "$(dirname "$0")"
./build.sh
DMG="build/ScreenOff.dmg"
STAGE=build/dmg
rm -rf "$STAGE" "$DMG"
mkdir -p "$STAGE"
cp -R build/ScreenOff.app "$STAGE/"
ln -s /Applications "$STAGE/Applications"
hdiutil create -volname "ScreenOff" -srcfolder "$STAGE" -fs HFS+ -format UDZO -ov "$DMG" >/dev/null
rm -rf "$STAGE"
shasum -a 256 "$DMG"
