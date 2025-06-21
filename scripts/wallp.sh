#!/usr/bin/env bash

# Directory where wallpapers are stored
WALLPAPER_DIR="$HOME/Pictures/HD_wallpapers/"

# Get the list of files
SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) \
    | fzf --style full --preview 'chafa {}' --preview-window=up:80% --layout=reverse)

# If a file was selected, set it as wallpaper
if [ -n "$SELECTED" ]; then
    swww img "$SELECTED" --transition-type grow --transition-duration 0.7
    wallust run $SELECTED
fi
