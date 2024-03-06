[Advanced Bash-Scripting Guide](https://web.archive.org/web/20220819180012/https://tldp.org/LDP/abs/html/) - [Hacker News Discussion](https://news.ycombinator.com/item?id=32523067)

[Scripts to Rule Them All - The GitHub Blog](https://github.blog/2015-06-30-scripts-to-rule-them-all/)

[github/scripts-to-rule-them-all: Set of boilerplate scripts describing the normalized script pattern that GitHub uses in its projects.](https://github.com/github/scripts-to-rule-them-all)

script/bootstrap – installs/updates all dependencies
script/setup – sets up a project to be used for the first time
script/update – updates a project to run at its current version
script/server – starts app
script/test – runs tests
script/cibuild – invoked by continuous integration servers to run tests
script/console – opens a console

[A cozy nest for your scripts - sd directory](https://ianthehenry.com/posts/a-cozy-nest-for-your-scripts/)

[Shell Script Best Practices](https://sharats.me/posts/shell-script-best-practices/) - [HN Discussion](https://news.ycombinator.com/item?id=33354286)

Pipeline command is treated as failed, even if one command in the pipeline fails.

```
set -o pipefail
```

Exit when one command fail, rather than continuing on

```
set -o errexit
```

Template

```
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

cd "$(dirname "$0")"

main() {
    echo do awesome stuff
}

main "$@"
```

[A decade of dotfiles](https://evanhahn.com/a-decade-of-dotfiles/) [HN](https://news.ycombinator.com/item?id=31557430)

## Prefer scripts over aliases

Let’s say I want to have a custom command called foo. I could do this in one of three ways:

1. Add an alias to my shell configuration, like alias foo=...
2. Add a function in my shell configuration, like foo () { ... }
3. Write a full shell script, and add it to my $PATH

I usually prefer to do the last option: a full shell script:

- You don’t need to reload your shell when you work on it. If you decide you want foo to behave a little differently, just edit the script and you’re done. You can even add new scripts to the folder and they’ll automatically be available. With functions and aliases, you need to reload things before they’re available.
- You have more choices of programming language. If you’re using Bash, aliases and functions have to be written in Bash. But scripts can be written in whatever you want, because they’re just executables like any other. I avoid writing scripts in compiled languages because I don’t want the complexity of a build step, but I could do it.
- I do this by having a folder, bin/ which I add to my $PATH.
