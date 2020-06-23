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
