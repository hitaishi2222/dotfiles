#!/usr/bin/env bash

fzf="fzf --height 40% --layout reverse --border" 

list_options=$(echo "compile clean glossaries" | tr " " "\n")

option=$(printf "$list_options" | $fzf)
echo $option


if [[ $option == "compile" ]]; then
    file=$(ls *.tex | $fzf) 
    lualatex --shell-escape $file
    bibtex "${file%.*}"
    lualatex --shell-escape $file
    lualatex --shell-escape $file
elif [[ $option == "clean" ]]; then
    latexclean
elif [[ $option == "glossaries" ]]; then
    file=$(ls *.tex | $fzf) 
    lualatex --shell-escape $file
    makeglossaries "${file%.*}"
else echo "Not selected anything..."
fi
