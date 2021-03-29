# awk

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

[Awk in 20 Minutes](https://ferd.ca/awk-in-20-minutes.html)

Awk scripting:
- each line of the file run through each pattern
- if pattern matches, then `ACTIONS` are run
- patterns are optional
- all variables are global
- [built in functions](https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din)

```awk
# comment
pattern1 { ACTIONS; }
pattern2 { ACTIONS; }
```

Example patterns:

```bash
/admin/ { ... }     # any line that contains 'admin'
/^admin/ { ... }    # lines that begin with 'admin'
/admin$/ { ... }    # lines that end with 'admin'
/^[0-9.]+ / { ... } # lines beginning with series of numbers and periods
/(POST|PUT|DELETE)/ # lines that contain specific HTTP verbs
```

`BEGIN` and `END`
- match before/after any line input to a file
- can do setup/teardown

Fields
- separated by whitespace
- `$0` entire line
- `$1` start

Example actions:
```bash
{ print $0; }  # prints $0. In this case, equivalent to 'print' alone
{ exit; }      # ends the program
{ next; }      # skips to the next line of input
{ a=$1; b=$0 } # variable assignment
{ c[$1] = $2 } # variable assignment (array)

{ if (BOOLEAN) { ACTION }
  else if (BOOLEAN) { ACTION }
  else { ACTION }
}

{ for (i=1; i<x; i++) { ACTION } }
{ for (item in c) { ACTION } }
```


[The AWK Programming Language (textbook)](https://ia802309.us.archive.org/25/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf)

[Why Learn AWK?](https://blog.jpalardy.com/posts/why-learn-awk/)

[Running Awk in parallel to process 256M records](https://ketancmaheshwari.github.io/posts/2020/05/24/SMC18-Data-Challenge-4.html)

[learnbyexample/learn_gnuawk](https://github.com/learnbyexample/learn_gnuawk/blob/master/gnu_awk.md)

https://lwn.net/SubscriberLink/820829/5bf9bf8bb9d6f2bf/


```
AWK is a text-processing language with a history spanning more than 40 years. It has a POSIX standard, several conforming implementations, and is still surprisingly relevant in 2020 — both for simple text processing tasks and for wrangling "big data". The recent release of GNU Awk 5.1 seems like a good reason to survey the AWK landscape, see what GNU Awk has been up to, and look at where AWK is being used these days.

The language was created at Bell Labs in 1977. Its name comes from the initials of the original authors: Alfred Aho, Peter Weinberger, and Brian Kernighan. A Unix tool to the core, AWK is designed to do one thing well: to filter and transform lines of text. It's commonly used to parse fields from log files, transform output from other tools, and count occurrences of words and fields. Aho summarized AWK's functionality succinctly:

AWK reads the input a line at a time. A line is scanned for each pattern in the program, and for each pattern that matches, the associated action is executed.

AWK programs are often one-liners executed directly from the command line. For example, to calculate the average response time of GET requests from some hypothetical web server log, you might type:

    $ awk '/GET/ { total += $6; n++ } END { print total/n }' server.log 
    0.0186667
This means: for all lines matching the regular expression /GET/, add up the response time (the sixth field or $6) and count the line; at the end, print out the arithmetic mean of the response times.
```
