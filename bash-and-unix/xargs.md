# xargs

Which Flags Should I Know About?

You should know how to control:

    The algorithm for splitting text into arguments (-d, -0). Discussed below.
    How many arguments are passed to each process (-n). This determines the total number of processes started.
    Whether processes are run in sequence or in parallel (-P).

https://news.ycombinator.com/item?id=28258189


## An Opinionated Guide to xargs

>  I always think of xargs as the inverse of echo. echo converts arguments to text streams, and xargs converts text streams to arguments.  - senkora on Aug 21, 2021 | prev | next [–]
	
senkora on Aug 21, 2021 | prev | next [–]

https://www.oilshell.org/blog/2021/08/xargs.html - [Hacker News Discussion](https://news.ycombinator.com/item?id=28258189)

```bash
$ echo 'alice bob' | xargs -n 1 -- echo hi
hi alice
hi bob
```

What's happening here?

- xargs splits the input stream on whitespace, producing 2 arguments, alice and bob,
- `-n 1`, xargs then passes each argument to a separate echo hi $ARG command.
- by default, it passes as many args to a command as possible, like `echo hi alice bob`.

It may help to mentally replace xargs with the word each. As in, for each word, line, or token, invoke this process with these args.

`xargs -I {}` {} is the input - can only be one thing

## How to split

Limit yourself to these three

- `xargs` split on whitespace/words,
- `xargs -d $'\n'` split lines,
- `xargs -0` untrusted data.

## num args to each process

`-n`

## parallel or not

`-P`

## echoing 

$ cat tasks.txt | xargs -n 1 -- $0 do_one

## composing

# Filter tasks by name
find ... | grep ... | xargs ...

# Limit the number of tasks.  I use this all the time
# for faster testing
find ... | head | xargs ...

# Believe it or not, I use this to randomize music
# and videos :)
find ... | shuf | xargs mplayer

