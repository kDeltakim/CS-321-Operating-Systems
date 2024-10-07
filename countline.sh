#!/bin/bash

line_count() {
    local dir="$1"
    local total_lines=0
    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            total_lines=$((total_lines + $(line_count "$item")))
        elif [ -f "$item" ]; then
            if [ -r "$item" ]; then
                lines=$(wc -l < "$item")
                total_lines=$((total_lines + lines))
            else
                echo "Error: Cannot read file: $item" >&2 >> error.txt
            fi
        else
            echo "Error: Unidentified object: $item" >&2 >> error.txt
        fi
    done
    echo "$total_lines"
}

numlines=0
if [ $# -eq 0 ]; then
    numlines=$(line_count ".")
else
    for arg in "$@"; do
        if [ -e "$arg" ]; then
            numlines=$((numlines + $(line_count "$arg")))
        else
            echo "Error: Path does not exist: $arg" >&2 >> error.txt
        fi
    done
fi
echo "Number of lines: $numlines"