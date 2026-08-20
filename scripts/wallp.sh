#!/usr/bin/env bash

# Directory where wallpapers are stored
WALLPAPER_DIR="$HOME/Pictures/HD_wallpapers/"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
OLD=$(awk '/path/ {print $3; exit}' $CONFIG_FILE)

#hyprlock
HYPRLOCK_FILE="$HOME/.config/hypr/hyprlock.conf"
OLDH=$(awk '/path/ {print $3; exit}' $HYPRLOCK_FILE)

# Files to reload
WAYBAR="$HOME/.config/waybar/style.css"
TMUX="$HOME/.config/tmux/tmux.conf"

# Get the list of files
SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) \
    | shuf | fzf --preview 'chafa -f symbols --colors truecolor {}' --preview-window=up:70%)

# If a file was selected, set it as wallpaper
if [ -n "$SELECTED" ]; then
    wallust run $SELECTED
    sed -i "s#$OLD#$SELECTED#g" "$CONFIG_FILE"
    sed -i "s#$OLDH#$SELECTED#g" "$HYPRLOCK_FILE"
    sed -i '' $WAYBAR
    sed -i '' $TMUX
    killall dunst
    hyprctl hyprpaper wallpaper eDP-1,$SELECTED
    hyprctl hyprpaper wallpaper ,$SELECTED
    qutebrowser ':config-source'
fi
