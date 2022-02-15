


Which Flags Should I Know About?

You should know how to control:

    The algorithm for splitting text into arguments (-d, -0). Discussed below.
    How many arguments are passed to each process (-n). This determines the total number of processes started.
    Whether processes are run in sequence or in parallel (-P).

https://news.ycombinator.com/item?id=28258189


## An Opinionated Guide to xargs
https://www.oilshell.org/blog/2021/08/xargs.html


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

What can we control?

- how we split text (`-d, -0`),
- how many arguments are passed to each process,
- whether processes are run in parallel `-P`