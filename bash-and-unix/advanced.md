# Advanced

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


## Command types

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


## Wildcards & patterns

`*` matches any character

`?` matches a single character

`[78]` matches either 7 or 8

`{1..4}` 1 2 3 4


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


## References

UNIX shell expansion: proper use and advanced forms - Tyson Whitehead - [talk](https://youtu.be/GXu1bZptwf4)

Concise GNU Bash: An Introduction to Advanced Usage - James Panacciulli @ LinuxFest Northwest 2017- [talk](https://youtu.be/BJ0uHhBkzOQ) - [slides](http://talk.jpnc.info/bash_lfnw_2017.pdf)
