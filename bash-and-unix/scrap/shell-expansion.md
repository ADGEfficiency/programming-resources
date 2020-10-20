
## xargs

Fixes the following problems
- some commands don't read from STDIN, pipe or file
- limit on the number of arguments

xargs
- converts STDIN into literal args
- partitions args & runs them separately


## GNU Parallel

Similar to xargs, except in parallel
## [UNIX shell expansion: proper use and advanced forms](https://youtu.be/GXu1bZptwf4)

REPL
- read line of text
- evaluate results
- print output
- loop (repeat)

Why shell (not GUI) = automation

Brace expansion (done by the shell, not the command)
- can't have spaces!!!
```bash
$ pre{1..4}fix

pre1fix pre2fix etc
```

`set -x` (for debugging)

Can use with `cp`:
```bash
$ cp file.dat{,.bak}

cp file.dat file.dat.bak
```

Or with rm
```bash
rm data.dat{a,b,c}
```

Brace expansion happens before `*`

`pushd`, `popd`

`$name` = parameter expansion

Can use `${!name}` for indirection

`;` = multiple commands on one line

arrays in round brackets

`names=(adam bob)`

Shell uses space to separate things - this can complicate other times we want to use spaces
- expands by default (scripts will break with spaces)
- quotes to control expansion

$parameter is the same as ${parameter}

Prefix & suffix removal
- `#` = remove pre
- `%` = remove suff

double = remove all matching

`${parameter##word}`

`${parameter/pattern/string}`

`${parameter//pattern/string}`

`${file%.txt}` (remove the suffix)
`${file%.*}` (remove the suffix)

`for file in *.data; do cp "$file" "$file.out"; done`

