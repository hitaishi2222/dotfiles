#!/usr/bin/env sh

theme="$HOME/Hiti/dotfiles/scripts/rofi_scripts/rounded-template.rasi"
OUTDIR="$HOME/Pictures/screenshots"
mkdir -p "$OUTDIR"

choice=$(printf "Full screen\nActive window\nSelect area\nCopy area" | \
    rofi -dmenu -p "Screenshot" -theme "${theme}")

[ -z "$choice" ] && exit 1

case "$choice" in
    "Full screen")
        hyprshot -m output -o "$OUTDIR"
        ;;

    "Active window")
        hyprshot -m window -o "$OUTDIR"
        ;;

    "Select area")
        hyprshot -m region -o "$OUTDIR"
        ;;

    "Copy area")
        hyprshot -m region --clipboard-only
        ;;
esac

sleep 0.3
hyprctl dispatch focuscurrentorlast >/dev/null 2>&1


# magick $FILENAME -shave 1x1 $FILENAMR
