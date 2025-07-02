#!/usr/bin/env bash

# Get figlet font directory
FONT_DIR=$(figlet -I2)

# Ask user what they want to print
read -rp "Enter the text to convert to ASCII art: " TEXT

# Check for dependencies
command -v fzf >/dev/null 2>&1 || { echo "fzf is not installed. Exiting."; exit 1; }
command -v figlet >/dev/null 2>&1 || { echo "figlet is not installed. Exiting."; exit 1; }

# Let user choose font with preview
SELECTED_FONT=$(find "$FONT_DIR" -name '*.flf' -exec basename {} .flf \; | \
  fzf --preview "figlet -f {} \"$TEXT\"" \
      --preview-window=up:70%:wrap \
      --prompt="Select a font: ")

# If no selection, exit
[[ -z "$SELECTED_FONT" ]] && echo "No font selected." && exit 1

# Print the final result
figlet -f "$SELECTED_FONT" "$TEXT"
