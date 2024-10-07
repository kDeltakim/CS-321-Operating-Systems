# Line Count Script

## Description
This bash script recursively counts the number of lines in all readable files within specified directories. 
It outputs the total line count while logging any errors for unreadable files or invalid paths.

---

## Prerequisites
- Unix/Linux-based operating system with Bash installed
- Ensure appropriate read permissions for the directories and files you want to analyze

---

## Installation

1. Clone this repository:
    ```bash
    git clone https://github.com/username/repository.git
    ```

2. Navigate to the project directory:
    ```bash
    cd repository
    ```

3. Make the script executable (if needed):
    ```bash
    chmod +x line_count.sh
    ```

---

## Usage

To run the script, you can provide one or more directories as arguments, or run it without arguments to count lines in the current directory.

```bash
./line_count.sh [directory1] [directory2] [...]
