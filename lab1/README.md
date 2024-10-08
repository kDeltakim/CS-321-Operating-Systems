# Line Count Script

## Description
This bash script recursively counts the number of lines in all readable files within specified directories. 
It outputs the total line count while logging any errors for unreadable files or invalid paths.

---

## Prerequisites
- Unix/Linux-based operating system with Bash installed
- Ensure appropriate read permissions for the directories and files you want to analyze

---

## Usage

To run the script, you can provide one or more directories as arguments, or run it without arguments to count lines in the current directory.

```bash
./line_count.sh [directory1] [directory2] [...]
```

---


### Examples

Without arguments: counts lines in directory.
```bash
./line_count.sh
```


With arguments: counts lines in specified directories.
```bash
./line_count.sh /path/to/dir1 /path/to/dir2
```

## Script structure
Edit: I know this is poorly structured. Bear with it for now. I'm still learning.
Visual diagram of a flow chart that includes the first few steps of the script. Excludes the final output.
![Blank board](https://github.com/user-attachments/assets/779ec114-3ec0-4385-b6ec-5255a9f5bb2b)



---


## Output
The script will output the total number of lines across all readable files:
```yaml
Number of lines: 1452
```

If an error occurs, such as an unreadable file or non-existent paths, they will be logged in an `error.txt` file.
```javascript
Error: Cannot read file: /path/to/unreadable/file
```

---


## Error Handling

Errors encountered during execution (such as unreadable files or invalid paths) are logged to `error.txt`. 
The script continues processing other files and directories even if errors occur.

