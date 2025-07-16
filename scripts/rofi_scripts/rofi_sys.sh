#!/usr/bin/env sh

theme="$HOME/Hiti/dotfiles/scripts/rofi_scripts/sys.rasi"

list_options=$(echo "shutdown reboot suspend hibernate" | tr " " "\n")

selected=$(printf "$list_options" | rofi -dmenu -p "do: " -theme ${theme})

if [[ $selected == "shutdown" ]]; then
    notify-send "System" "Powering off"
    systemctl poweroff
elif [[ $selected == "reboot" ]]; then
    notify-send "System..." "System is undergoing reboot..."
    systemctl reboot
elif [[ $selected == "suspend" ]]; then
    notify-send "System..." "Logging off..."
    systemctl suspend
elif [[ $selected == "hibernate" ]]; then
    notify-send "System..." "Logging off..."
    systemctl hibernate
else
    notify-send "System..." "Nothing selected: Back to work..."
fi
