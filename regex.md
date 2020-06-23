# Regex

Use `/` to indicate the start and end of a search

Expressions that match patterns
- can have multiple matches

Match on the entire line

## Matches

`.` match any character
`\.` match special character (in this case `.`)

`^` = starts with
`$` = ends with

`r` = raw string

`\d` = digit
`\w` = alphanumeric
`\s` = space, tab, new line

Capitalize to inverse:

`\D` = not a digit
`\W` = not alphanumeric


## Character classes

Match one of several characters

`gr[ae]y` -> gray, grey

Can match a range

`[a-e]`

`[0-9]`

Can negate

`[^0-5]`

Can repeat to match multiple using 
- `?` (zero or one) 
- `*` (zero or more)
- `+` (one or more)

`|` for multiple patters

`( )` for groups

`{ }` for a range


## Examples

For all vowels
[aeioiAEIOU]

For all non-vowels
[^aeioiAEIOU]

Any alphanumeric
[0-9a-zA-Z] (same as \w)

Two vowels
[aeiou][aeiou]

Need to escape heaps of the characters
[\(\)] = matches ( or )

`/hij/` will find `hij` (case sensitive)


## Flags 

Put on end

`/hij/g` global (return all matches)

`/hij/i` case insensitive

`/hij/m` multiline



## Quantifiers

Specifying quantity

pattern-quantity

\d{3}-\d{3}-\d{4}

`*` 0 or more
`+` 1 or more
`?` 0 or 1
`{2}` exactly 2
`{2, 4}` 2 to 4

\d+ = one or more digits
\d{3,5} = between 3 and 5
\d{3,} = 3 or more

[aeiou]+ = one or more vowels

If we want constant-vowel, constanant-vowel n times

Use () to group

To match sayonara

([^aeiou][aeiou])+

## Resources

[Al Sweigart Yes, It's Time to Learn Regular Expressions PyCon 2017 (youtube)](https://www.youtube.com/watch?v=abrcJ9MpF60)

[Read This If You Don’t Know Enough About Regex](https://levelup.gitconnected.com/read-this-if-you-dont-know-enough-about-regex-73141bb0e1a7)

[Regexp (The GNU Awk User's Guide)](https://www.gnu.org/software/gawk/manual/html_node/Regexp.html)
