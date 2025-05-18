#!/usr/bin/env bash

# Change this if your .py files are in a specific directory
SCRIPT_DIR="."

# Step 1: Choose a Python file
PYFILE=$(find "$SCRIPT_DIR" -type f -name "*.py" | fzf --prompt="Select a Python file: ")
[[ -z "$PYFILE" ]] && echo "No file selected." && exit 1

# Step 2: Extract class lines and select a class
CLASS_LINE=$(grep -E "^\s*class\s+\w+\(.*\):" "$PYFILE" | fzf --prompt="Select a class: ")
[[ -z "$CLASS_LINE" ]] && echo "No class selected." && exit 1

# Step 3: Extract the class name (word after 'class')
CLASS_NAME=$(echo "$CLASS_LINE" | sed -E 's/^\s*class\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(.*\):.*/\1/')
[[ -z "$CLASS_NAME" ]] && echo "Could not extract class name." && exit 1

# Step 4: Compile with manim
echo "Running: manim \"$PYFILE\" \"$CLASS_NAME\""
manim "$PYFILE" "$CLASS_NAME" -qm
