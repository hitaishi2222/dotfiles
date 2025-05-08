#!/bin/bash

RULE_FILE="/etc/udev/rules.d/90-disable-touchpad.rules"
DEVICE_NAME="ELAN1200:00 04F3:30BA Touchpad"

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root (use sudo)."
    exit 1
fi

if [ -f "$RULE_FILE" ]; then
    echo "Touchpad is currently disabled. Enabling..."
    rm "$RULE_FILE"
else
    echo "Touchpad is currently enabled. Disabling..."
    echo "ATTRS{name}==\"$DEVICE_NAME\", ENV{LIBINPUT_IGNORE_DEVICE}=\"1\"" > "$RULE_FILE"
fi

udevadm control --reload-rules
udevadm trigger
