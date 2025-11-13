#!/usr/bin/env sh

CONFIG_FILE="$HOME/.config/nvim/lua/plugins/arduino.lua"
LSP_FILE="$HOME/.config/nvim/lua/plugins/lsp.lua"

TYPE1="arduino:renesas_uno:unor4wifi"
TYPE2="arduino:avr:uno"

PORT1="/dev/ttyACM0"
PORT2="/dev/ttyUSB0"

if grep -q "$TYPE1" "$CONFIG_FILE"; then
  sed -i "s/$TYPE1/$TYPE2/g; s|$PORT1|$PORT2|g" "$CONFIG_FILE"
  sed -i "s/$TYPE1/$TYPE2/g" "$LSP_FILE"
  echo "Switched to UNO R3"
else
  sed -i "s/$TYPE2/$TYPE1/g; s|$PORT2|$PORT1|g" "$CONFIG_FILE"
  sed -i "s/$TYPE2/$TYPE1/g" "$LSP_FILE"
  echo "Switched to UNO R4 EK"
fi
