# An Introduction to Bash & UNIX

These are notes for a course on the shell, terminal, and command line with Bash:

- [intro.md](https://github.com/ADGEfficiency/programming-resources/blob/master/bash-and-unix/intro.md) - basics of the shell for beginners,
- [unix-philosohpy.md](https://github.com/ADGEfficiency/programming-resources/blob/master/bash-and-unix/unix-philosophy.md) - the philosophy of UNIX,
- [working-with-data.md](https://github.com/ADGEfficiency/programming-resources/blob/master/bash-and-unix/unix-philosophy.md) - patterns for working with data in a shell,
- [advanced.md](https://github.com/ADGEfficiency/programming-resources/blob/master/bash-and-unix/advanced.md) - advanced tips & tricks.

![](berlin-wall.jpg)

<p align="center"><i>Eastside Gallery - Berlin, 2019</i></p>

## Resources

You can also find hard copies of additional resources in [programming-resources/bash-and-unix/resources](https://github.com/ADGEfficiency/programming-resources/tree/master/bash-and-unix/resources).

[explainshell.com](https://explainshell.com/) is a tool that will match command-line arguments to their help text.

### For Beginners

[Survival guide for Unix newbies](https://matt.might.net/articles/basic-unix/)

[Effective Shell](https://effective-shell.com/)

### References

[UNIX Toolbox](http://cb.vu/unixtoolbox.xhtml) - collection of Unix/Linux/BSD commands and tasks (like a cheat sheet)

[Modern Unix](https://github.com/ibraheemdev/modern-unix) - modern/faster/saner alternatives or complements to common unix commands

[6 Command Line Tools for Productive Programmers](https://earthly.dev/blog/command-line-tools/)

[Linux/BSD command line wizardry: Learn to think in sed, awk, and grep](https://arstechnica.com/gadgets/2021/08/linux-bsd-command-line-101-using-awk-sed-and-grep-in-the-terminal/) - good for beginners.

- grep finds strings,
- sed replaces strings,
- awk finds columns.

[The Bash Hackers Wiki](https://wiki.bash-hackers.org/) - documentation of any kind about GNU Bash. The main motivation was to provide human-readable documentation and information so users aren't forced to read every bit of the Bash manpage.

[The Architecture of Open Source Applications: The Bourne-Again Shell](http://www.aosabook.org/en/bash.html) - bash's major components: input processing, parsing, the various word expansions and other command processing, and command execution, from the pipeline perspective

UNIX shell expansion: proper use and advanced forms - Tyson Whitehead - [talk](https://youtu.be/GXu1bZptwf4)

Concise GNU Bash: An Introduction to Advanced Usage - James Panacciulli @ LinuxFest Northwest 2017- [talk](https://youtu.be/BJ0uHhBkzOQ) - [slides](http://talk.jpnc.info/bash_lfnw_2017.pdf)

### History

[Origin of the Shell](https://multicians.org/shell.html)

[Non-POSIX file systems](https://weinholt.se/articles/non-posix-filesystems/)

[Unix at 50: How the OS that powered smartphones started from failure - Ars Technica](https://arstechnica.com/gadgets/2019/08/unix-at-50-it-starts-with-a-mainframe-a-gator-and-three-dedicated-researchers/)

[Ken Thompson's Unix password](https://leahneukirchen.org/blog/archive/2019/10/ken-thompson-s-unix-password.html)

[Pipe: How the System Call That Ties Unix Together Came About](https://thenewstack.io/pipe-how-the-system-call-that-ties-unix-together-came-about/)

[The beauty of Unix pipelines](https://prithu.xyz/posts/unix-pipeline/)
- [Hacker News discussion](https://news.ycombinator.com/item?id=23420786)

[The Challenges of Integrating the Unix and Mac OS Environments](https://www.usenix.org/legacy/publications/library/proceedings/usenix2000/invitedtalks/sanchez_html/sanchez.html)

### Courses

[DataCamp Introduction to Shell for Data Science - Datacamp Course](https://www.datacamp.com/courses/introduction-to-shell-for-data-science)

### Blog Posts / Discussions

[Bash Patterns I Use Weekly](https://will-keleher.com/posts/5-Useful-Bash-Patterns.html)

[Gödel's Incompleteness Theorem in Bash](https://lacquer.io/math/2022/02/24/godels-incompleteness-in-bash.html)

[Shell Script Best Practices](https://sharats.me/posts/shell-script-best-practices/) - [HN Discussion](https://news.ycombinator.com/item?id=33354286)

[The beauty of Unix pipelines](https://prithu.xyz/posts/unix-pipeline/)

Best things in your bash_profile/aliases? - [Hacker News](https://news.ycombinator.com/item?id=18898523)

[Six glorious commands worth getting to know](https://astrobiomike.github.io/bash/six_commands#tr)

[An Illustrated Guide to Useful Command Line Tools](https://www.wezm.net/technical/2019/10/useful-command-line-tools/)

[Ten Things I Wish I’d Known About bash](https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/)

[Shells are Two Things](https://borretti.me/article/shells-are-two-things)

[Unix Shell Programming: The Next 50 Years](https://sigops.org/s/conferences/hotos/2021/papers/hotos21-s06-greenberg.pdf)

[A slack clone in 5 lines of Bash](https://the-dam.org/docs/explanations/suc.html)

[Hints for writing Unix tools](https://monkey.org/~marius/unix-tools-hints.html)

[Command-line Tools can be 235x Faster than your Hadoop Cluster](https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html)

[The UNIX Time-Sharing System](https://chsasank.com/classic_papers/unix-time-sharing-system.html)

[The Evolution of the Unix Time-sharing System](https://www.bell-labs.com/usr/dmr/www/hist.pdf)

### Talks

UNIX shell expansion: proper use and advanced forms - Tyson Whitehead - [talk](https://youtu.be/GXu1bZptwf4)

Concise GNU Bash: An Introduction to Advanced Usage - James Panacciulli @ LinuxFest Northwest 2017- [talk](https://youtu.be/BJ0uHhBkzOQ) - [slides](http://talk.jpnc.info/bash_lfnw_2017.pdf)

### Guides

[BashGuide - Greg's Wiki](https://mywiki.wooledge.org/BashGuide)

[Command line wizardry, part one: Learn to think in sed, awk, and grep | Ars Technica](https://arstechnica.com/gadgets/2021/08/linux-bsd-command-line-101-using-awk-sed-and-grep-in-the-terminal/)

[Command line wizardry, part two: Variables and loops in Bash](https://arstechnica.com/gadgets/2021/09/command-line-wizardry-part-two-variables-and-loops-in-bash/)

Capturing command output:

```shell-session
$ echo $(echo test)
test
```

For loops:

```shell-session
$ for x in $y ; do echo "x equals $x" ; done
x equals 1
x equals 2
x equals 3
```

Work with entire line in file:

```shell-session
$ cat lines.txt | while read x ; do echo $x ; done
```


[Shell programming with bash: by example, by counter-example](https://matt.might.net/articles/bash-by-example/)

[routeback/bashscripts](https://github.com/routeback/bashscripts) - a collection of GNU/Linux bash scripts

[Bash Pitfalls](https://mywiki.wooledge.org/BashPitfalls) - a compilation of common mistakes made by bash users

[Unix for Poets](https://www.cs.upc.edu/~padro/Unixforpoets.pdf) - text processing guide

[jlevy/the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line) - a selection of notes and tips on using the command-line that we've found useful when working on Linux

Cat On Mat - Bash One-Liners Explained
-[part one](https://catonmat.net/bash-one-liners-explained-part-one) - working with files
-[part two](https://catonmat.net/bash-one-liners-explained-part-two) - working with strings
-[part three](https://catonmat.net/bash-one-liners-explained-part-three) - redirections
-[part four](https://catonmat.net/bash-one-liners-explained-part-four) - history
-[part five](https://catonmat.net/bash-one-liners-explained-part-five) - navigation

dwmkerr.com - Effective Shell
- [Part 1: Navigating the Command Line](https://www.dwmkerr.com/effective-shell-part-1-navigating-the-command-line/)
- [Part 2: Become a Clipboard Gymnast](https://www.dwmkerr.com/effective-shell-part-2-become-a-clipboard-gymnast/)
- [Part 3: Getting Help](https://www.dwmkerr.com/effective-shell-part-3-getting-hepl/)
- [Part 4: Moving Around](https://dwmkerr.com/effective-shell-4-moving-around/)
- [Part 5: Interlude - Understanding the Shell](https://dwmkerr.com/effective-shell-part-5-understanding-the-shell/)
- [Part 6: Everything You Don't Need to Know About Job Control](https://dwmkerr.com/effective-shell-6-job-control/)
- [Part 7: The Subtleties of Shell Commands](https://dwmkerr.com/effective-shell-7-shell-commands/)

### Textbooks

[Effective Shell](https://effective-shell.com/)
