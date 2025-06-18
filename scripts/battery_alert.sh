#!/usr/bin/env bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

state=$(acpi | awk '/Battery 1/ {print $3}'| sed 's/,//g')
percent=$(acpi | awk '/Battery 1/ {print $4}'| sed 's/,//g')

notify-send "Battery Info:" "$state : $percent"

