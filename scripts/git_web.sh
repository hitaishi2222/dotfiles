#!/usr/bin/env bash

fzf="fzf --height 40% --layout reverse --border" 

LINK=$(git remote)
URL=$(git remote get-url $LINK)

xdg-open $URL


