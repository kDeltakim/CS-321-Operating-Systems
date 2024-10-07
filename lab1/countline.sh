#!/bin/bash

# Function: line_count
# Recursively counts the total number of lines in all readable files within a directory.
# Arguments:
#   $1 - Directory path to begin counting from.
# Returns:
#   Prints the total line count for the directory.
line_count() {
    # Store the first argument (directory path) into the 'dir' variable
    local dir="$1"
    # Initialize the total line count to zero
    local total_lines=0
    
    # Loop through each item in the directory
    for item in "$dir"/*; do
        # If the item is a directory, call line_count recursively
        if [ -d "$item" ]; then
            total_lines=$((total_lines + $(line_count "$item")))
        # If the item is a regular file, process it
        elif [ -f "$item" ]; then
            # Check if the file is readable
            if [ -r "$item" ]; then
                # Get the number of lines in the file using 'wc -l'
                lines=$(wc -l < "$item")
                # Add the number of lines to the total
                total_lines=$((total_lines + lines))
            else
                # If the file is not readable, output an error message to stderr and log it in 'error.txt'
                echo "Error: Cannot read file: $item" >&2 >> error.txt
            fi
        else
            # Handle the case where the item is neither a file nor a directory
            echo "Error: Unidentified object: $item" >&2 >> error.txt
        fi
    done
    # Return the total line count for this directory
    echo "$total_lines"
}

# Initialize the number of lines to zero
numlines=0

# If no arguments are passed to the script, count lines in the current directory
if [ $# -eq 0 ]; then
    numlines=$(line_count ".")
else
    # If arguments are passed, loop through each argument
    for arg in "$@"; do
        # Check if the argument is a valid path (either a file or directory)
        if [ -e "$arg" ]; then
            # Add the line count of the argument (file or directory) to 'numlines'
            numlines=$((numlines + $(line_count "$arg")))
        else
            # If the path does not exist, output an error message to stderr and log it in 'error.txt'
            echo "Error: Path does not exist: $arg" >&2 >> error.txt
        fi
    done
fi

# Output the total number of lines counted
echo "Number of lines: $numlines"

