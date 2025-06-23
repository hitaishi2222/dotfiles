#!/usr/bin/env bash

# Directory where wallpapers are stored
WALLPAPER_DIR="$HOME/Pictures/HD_wallpapers/"

# Get the list of files
SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) \
    | fzf --preview 'chafa -f symbols --colors truecolor {}' --preview-window=up:70%)

# If a file was selected, set it as wallpaper
if [ -n "$SELECTED" ]; then
    hyprctl hyprpaper reload DP-6,$SELECTED
    wallust run $SELECTED
fi
