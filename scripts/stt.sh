#!/usr/bin/env bash

MODEL="$HOME/Research/local_llms/ggml-small.en.bin"
TMP=$(mktemp --suffix=.wav)

# record microphone (5 seconds)
ffmpeg -f pulse -i default -ac 1 -ar 16000 -t 5 -y "$TMP" -loglevel quiet

# transcribe using llama.cpp whisper
TEXT=$(whisper-cli -m "$MODEL" -f "$TMP" -otxt -of - 2>/dev/null | sed 's/\[.*\]//g')

# type at cursor
echo "$TEXT" | wtype

rm "$TMP"
