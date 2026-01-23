#!/usr/bin/env sh

theme="$HOME/Hiti/dotfiles/scripts/rofi_scripts/rounded-template.rasi"
OUTDIR="$HOME/Pictures/screenshots"
mkdir -p "$OUTDIR"

choice=$(printf "Full screen\nActive window\nSelect area\nCopy area" | rofi -dmenu -p "Screenshot" -theme ${theme})

if [ -z "$choice" ]; then
    exit 1
fi

FILENAME="$OUTDIR/$(date +%F_%H-%M-%S).png"
notify() {
    notify-send -t 5000 "Screenshot" "$1"
}

case "$choice" in
    "Full screen")
        grim - | tee "$FILENAME" | wl-copy
        notify "Fullscreen saved to <b>$FILENAME</b> and copied."
        ;;
    "Active window")
        slurp -d -w | grim -g - | tee "$FILENAME" | wl-copy
        notify "Active window saved to <b>$FILENAME</b> and copied."
        ;;
    "Select area")
        slurp -d | grim -g - | tee "$FILENAME" | wl-copy
        notify "Area saved to <b>$FILENAME</b> and copied."
        ;;
    "Copy area")
        slurp | grim -g - - | magick -trim - | wl-copy
        notify "Area copied to clipboard."
        ;;
esac
