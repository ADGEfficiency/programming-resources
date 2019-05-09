## Character classes

Match a group of symbols

r = raw string

\d = digit
\w = alphanumeric
\s = space, tab, new line

\D = not a digit
\W = not alphanumeric
etc

Custom character classes

For all vowels
[aeioiAEIOU]

For all non-vowels
[^aeioiAEIOU]

[0-9a-zA-Z] = \w

Need to escape heaps of the characters
[\(\)] = matches ( or )

## Specifying quantity

pattern-quantity

\d{3}-\d{3}-\d{4}

\d+ = one or more digits
\d{3,5} = between 3 and 5
\d{3,} = 3 or more

[aeiou]+ = one or more vowels

If we want constant-vowel, constanant-vowel n times

Use () to group

To match sayonara

([^aeiou][aeiou])+

## Resources

[pyregex - try out regular expressions in the browswer](http://www.pyregex.com/)

[Al Sweigart Yes, It's Time to Learn Regular Expressions PyCon 2017 (youtube)](https://www.youtube.com/watch?v=abrcJ9MpF60)
