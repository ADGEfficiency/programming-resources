
# grep

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


## Reading

[Command line made easy: five simple recipes for grep](https://arstechnica.com/information-technology/2009/05/command-line-made-easy-five-simple-recipes-for-grep/?itm_source=parsely-api)

[Linux/BSD command line wizardry: Learn to think in sed, awk, and grep](https://arstechnica.com/gadgets/2021/08/linux-bsd-command-line-101-using-awk-sed-and-grep-in-the-terminal/) - good for beginners.

[Command line made easy: five simple recipes for grep | Ars Technica](https://arstechnica.com/information-technology/2009/05/command-line-made-easy-five-simple-recipes-for-grep/?itm_source=parsely-api)

```
$ grep needle haystack.txt
```

Limit to lines where query is surronunded by spaces:

```
$ grep -w needle haystack.txt
```

Search logs and only show actual match:

```
$ grep -wo http://.* channel.log | tail
```

Search for either `segphault` or `segphone`:

```
$ grep -c "^<segph(ault|one)>" channel.log
```

Look for lines that contain five or more capital letters in a row:

```
$ grep -w "[A-Z]+{5,}" channel.log
```

## Resources

[grep: A Practical Guide](https://www.youtube.com/watch?v=crFZOrqlqao)

Count:

```
grep -c
```

Case insensitive:

```
grep -i
```

Print lines that aren't matched

```
grep -v
```

Match the entire line:

```
grep -x
```

Match the entire word (not a substring of the word):

```
grep -w
```

Negate special characters:

```
grep -e
```

Print lines before or after:

```
grep -w -A 3 -B 3
```

Search for multiple things:

```
grep '404\|500'

# extended regex means no escaping
grep -E '404|500'
```

Any 400 error:

```
grep '4[0-9][0-9]'
```

### Regex patterns

Start of the line:

```
grep '^FROM'
```

End of the line:

```
grep 'FROM$'
```

Inside:

```
grep '^<.*>$'
```

Boundaries:

```
grep '\bthe\b'
```
