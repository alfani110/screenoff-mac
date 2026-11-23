#!/bin/zsh
# Regenerates Resources/AppIcon.icns from scripts/make-icon.swift.
set -euo pipefail
cd "$(dirname "$0")/.."
work=$(mktemp -d)
swift scripts/make-icon.swift "$work/icon.png"
set=$work/AppIcon.iconset
mkdir "$set"
for px in 16 32 128 256 512; do
  sips -z $px $px "$work/icon.png" --out "$set/icon_${px}x${px}.png" >/dev/null
  sips -z $((px*2)) $((px*2)) "$work/icon.png" --out "$set/icon_${px}x${px}@2x.png" >/dev/null
done
iconutil -c icns "$set" -o Resources/AppIcon.icns
cp "$work/icon.png" docs/icon.png 2>/dev/null || true
echo "Wrote Resources/AppIcon.icns"
