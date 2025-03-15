#!/usr/bin/env bash

fzf="fzf --height 40% --layout reverse --border" 

list_options=$(echo "run clippy fix build" | tr " " "\n")

option=$(printf "$list_options" | $fzf)
echo $option


if [[ $option == "build" ]]; then
    cargo build
elif [[ $option == "run" ]]; then
    cargo run
elif [[ $option == "clippy" ]]; then
    cargo clippy
elif [[ $option == "fix" ]]; then
    cargo fix
else echo "Not selected anything..."
fi 
 
