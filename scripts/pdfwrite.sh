#!/usr/bin/env bash

fzf="fzf --height 40% --layout reverse --border" 

list_options=$(echo "compress trim_pdf" | tr " " "\n")

option=$(printf "$list_options" | $fzf)
echo $option

if [[ $option == "compress" ]]; then
    file=$(ls *.pdf | $fzf) 
    read -p "Enter the output file name: " OUTPUT_FILE
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$OUTPUT_FILE.pdf $file
elif [[ $option == "trim_pdf" ]]; then
    file=$(ls *.pdf | $fzf) 
    read -p "Enter the start page: " START_PAGE
    read -p "Enter the end page: " END_PAGE
    read -p "Enter the output file name: " OUTPUT_FILE
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$OUTPUT_FILE.pdf $file -dFirstPage=$START_PAGE -dLastPage=$END_PAGE
else echo "Not selected anything..."
