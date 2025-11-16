#!/usr/bin/env sh

theme="$HOME/Hiti/dotfiles/scripts/rofi_scripts/rounded-template.rasi"
OUTDIR="$HOME/Pictures/screenshots"

list_options=$(echo "copy_region save_region copy_window save_window copy_active_screen save_active_screen" | tr " " "\n")

selected=$(printf "$list_options" | rofi -dmenu -p "do: " -theme ${theme})

if [[ $selected == "copy_region" ]]; then
    hyprshot -m region --clipboard-only
elif [[ $selected == "save_region" ]]; then
    hyprshot -m region -o $OUTDIR
elif [[ $selected == "copy_window" ]]; then
    hyprshot -m window --clipboard-only
elif [[ $selected == "save_window" ]]; then
    hyprshot -m window -o $OUTDIR
elif [[ $selected == "copy_active_screen" ]]; then
    hyprshot -m active -m output --clipboard-only
elif [[ $selected == "save_active_screen" ]]; then
    hyprshot -m active -m output -o $OUTDIR
else
    notify-send "System..." "Nothing selected: Back to work..."
fi
