## Wildcards

`?` matches a single character

`[78]` matches either 7 or 8

`{.txt, .csv}` matches txt or csv files


## Unix tools

htop, grep, vim, tmux, cut, sort
- history of each tool

Build up the tools gradually - combining them as you go
- `tree | less`
- `cat cheat_sheet.md | less`

## Finding files by filename

`find . -iname "match"`

## Finding content in files

`grep -r match .`
`grep -rl match .`  # return filename only

## grep

`grep search_term filename`

some of grep's more common flags:

-c: print a count of matching lines rather than the lines themselves
-h: do not print the names of files when searching multiple files
-i: ignore case (e.g., treat "Regression" and "regression" as matches)
-l: print the names of files that contain matches, not the matches
-n: print line numbers for matching lines
-v: invert the match, i.e., only show lines that don't match

`ps aux | grep mongo`

`grep -rl 'search term' .`

`grep -rl CMA .` to find where CMA class is in a folder		

## awk

[Brian Kernighan on successful language design](https://www.youtube.com/watch?v=Sg4U4r_AgJU)

One or two line programs that can be written on the command line

Selection and validation
- print all lines longer than 80 characters

```bash
length > 80
```

Transform & rearrange
- replace second field by it's log

```bash
{ $2 = log($2) ; print }
```

Summarize
- add numbers in first field, print sum and average

```bash
	{ sum += 1 }
END { print sum, sum/NR }
```

`awk $3 > 6`

## Pattern-action

Common paradigm (also followed by `sed` and `grep`)

```bash
pattern { action }

awk 'program' [ file1 file2 ... ]
awk -f program_file [ file1 file2 ... ]

for each file
	for each input line
		for each pattern
			if pattern matches input line
				do action
```

Lines are split into fields

- `$1, $2`
- `$0` for entire line
