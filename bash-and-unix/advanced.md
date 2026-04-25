# Advanced Bash

`set -x` (for debugging)

`pushd` = saves current working directory & changes to new directory

`popd` = go back to old working directory

Example:
```bash
$ cd old-dir

$ pushd new-dir
#  now in new-dir
#  do some things

$ popd
#  now in old-dir
```

## Command Types

- word = sequence of characters
- list = sequence of commands / pipelines
- parameter = entity that stores values
- variable = parameter denoted by a name
- arrays in round brackets - `names=(adam bob)`

## Lists

`one ; two` run one, then two (same as new line separation)

`one & two` one in background, two executed simultaneously

`one && two` only run two if one returns 0

`one || two` only run two if one fails


## Infomation from last command

`!$` last element of previous command

`!:3` third

`!*` all

`!!` entire command

## Replace in last command

```bash
$ cat _drafts/file.md

$ ^draft^note
cat _notes/file.md
```

Same as

```bash
$ !!:gs/draft/note/

$ !:gs/draft/note/
```

## Wildcards & patterns

`*` matches any character

`?` matches a single character

`[78]` matches either 7 or 8

`{1..4}` 1 2 3 4


## Shell Parameter Expansion

`${param}`

[3.5.3 Shell Parameter Expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

## Brace expansion

Can't have spaces!

```bash
$ pre{1..4}fix
pre1fix pre2fix pre3fix pre4fix
```

Useful patterns including moving files:

```bash
$ mv file.data{,.bak}
# mv file.data file.data.bak
```

Copying files:

```bash
$ cp file.dat{,.bak}
# cp file.dat file.dat.bak
```

This can also be used inside strings:

$ cp data/{raw,final}/train.csv
# cp data/raw/train.csv data/final/train.csv

## Parameter expansion  

`$name` = parameter expansion

`$parameter` is the same as `${parameter}`

Prefix & suffix removal
- `#` = remove prefix
- `%` = remove suffix
- double `##` or `%%` = remove all matching

### Substrings

`param="unix-is-fun"`

Replace by position:

```bash
${param:offset:length}

echo ${param:4}
# -is-fun

echo ${param:4:4}
# -is-
```

Replace by pattern from the start `#`:

```bash
echo ${param#*x}
# -is-fun
```

Replace by pattern from the end `%`:

```bash
echo ${param%x*}
# uni
```

Both commands can be made greedy using `##` or `%%`:

```bash
echo ${param%i*}
# unix-

echo ${param%%i*}
# un
```

A useful pattern is to split at a `/`:

```bash
PTH="home/folder/file.suffix"

echo ${PTH#*\/}
# folder/file.suffix

echo ${PTH##*\/}
#  file.suffix

echo ${PTH%\/*}
#  home/folder

echo ${PTH%%\/*}
#  home
```

Suffix removal:

```bash
echo ${PTH%.suffix}
#  home/folder/file

echo ${PTH%.*}
#  home/folder/file
```

### Substitution

Similar to expansion, except using `/`

Substitution:
```bash
${param/pattern/string}

${param//pattern/string}
```

Substitution from left `#` and right `%` edge:
```bash
${param/#pattern/string}

${param/%pattern/string}
```

Example

```bash
PTH="home/folder/folder/file.suffix"

$ echo ${PTH/home/user}
user/folder/folder/file.suffix

$ echo ${PTH/folder/fldr}
home/fldr/folder/file.suffix

$ echo ${PTH//folder/fldr}
home/fldr/fldr/file.suffix
```

## Arithmetic

`(( do math in here ))`

## Return Values

- success = 0 
- failure = 1 to 255

## Conditionals

`[[ -e file ]]` file exists

`[[ -d file ]]` file is a directory

## Run in background

```bash
jupyter lab &
```

Run in background and redirect output:

```bash
jupyter lab > /dev/null 2>&1 &
```

See jobs running in background

```bash
jobs
```

To bring a job to the front

```bash
fg

fg %number
```

## Iteration

Single line for loop to copy files:

`for file in *.data; do cp "$file" "$file.out"; done`


## Parameter Defaults

```bash
${parameter:?word}  # error if not set
${parameter:-word}  # default
${parameter:=word}  # assignment
```


## `$*` vs `$@` Quoting

`$*` = all positional params (single word when quoted)

`$@` = all positional params (separate words when quoted)

```bash
myfunc() { printf "%q\n" $*; } && myfunc 1 "2 3" 4
1
2
3
4

myfunc() { printf "%q\n" "$*"; } && myfunc 1 "2 3" 4
1\ 2\ 3\ 4\

myfunc() { printf "%q\n" $@; } && myfunc 1 "2 3" 4
1
2
3
4

myfunc() { printf "%q\n" "$@"; } && myfunc 1 "2 3" 4 5
1
2\ 3
4
5
```

Without quotes, `$*` and `$@` behave the same (word splitting occurs). With quotes, `"$*"` joins all args into one word; `"$@"` expands each arg as a separate word.


## Indirection

`!` induces indirection — `${!name}` expands to the value of the variable whose name is stored in `name`:

```bash
$ name=bob
$ bob=man
$ echo $name
bob
$ echo $bob
man
$ echo ${!name}
man
```


## Arrays — `declare -a` and Key Access

```bash
declare -a names='([0]="bob brown" [1]="sue")'

# to get the keys
echo "${!names[@]}"

# accessing elements
echo ${names[0]}
```


## Control Flow — if/elif/else

```bash
if list0
  then list1
fi

if list0
  then list1
  elif list2
    then list3
  else list4
fi
```

Tests use `[[ expression ]]`.


## Directory Stack — `~n` Shorthand

`pushd` / `popd` maintain a directory stack. `~2` navigates to the second entry on the stack without popping:

```bash
$ dirs         # show the stack
$ pushd /tmp   # push /tmp, cd to it
$ ~2           # go to second stack entry
$ popd         # return to previous
```


## `$_` — Last Argument of Previous Command

`$_` holds the last argument of the previous command. Distinct from `!$` (history expansion — only works interactively).

```bash
mv from to
cd $_
# cd to "to"
```


## Command Evaluation Order

A shell command has the form: `[assignment ...] [word ...] [redirection ...]`

Evaluation steps:
1. Expand non-variable assignments and redirections; first word is the command, rest are args
2. Perform redirections
3. Expand and assign variables (variable assignments are local to the command if a command is present, global otherwise)
4. Alias expansion (if command is not quoted)
5. Run the command — external programs run in a separately inherited environment

Inline variable assignments (`FOO=bar cmd`) are local to that command only.
