#!/usr/bin/env bash

fzf="fzf --height 40% --layout reverse --border" 

file=$( ls *.f90 | $fzf) 
gfortran $file -o "${file%.*}"
"${file%.*}"
