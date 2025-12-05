#!/usr/bin/env sh

theme="$HOME/Hiti/dotfiles/scripts/rofi_scripts/rounded-template.rasi"
OUTDIR="$HOME/Pictures/screenshots"
mkdir -p "$OUTDIR"

grimblast="$HOME/Hiti/dotfiles/scripts/grimblast"
if [ ! -f "$grimblast" ]; then
    echo "Grimblast script is missing. Check the path or download the script."
fi

choice=$(printf "Full screen\nActive window\nSelect area\nCopy area" | rofi -dmenu -p "Screenshot" -theme ${theme})

case "$choice" in
    "Full screen")
        $grimblast save screen "$DIR/screen_$(date +%s).png"
        ;;
    "Active window")
        $grimblast save window "$DIR/window_$(date +%s).png"
        ;;
    "Select area")
        $grimblast save area "$DIR/area_$(date +%s).png"
        ;;
    "Copy area")
        $grimblast copy area
        ;;
esac
