https://youtu.be/BJ0uHhBkzOQ

http://talk.jpnc.info/bash_lfnw_2017.pdf

word = sequence of characters

list = sequence of commands / pipelines

parameter = entity that stores values

variable = parameter denoted by a name

## return values

0 = success

failure = 1 to 255

## lists

`one ; two` run one, then two (same as new line separation)

`one & two` one in background, two executed simultaneously

`one && two` only run two if one returns 0

`one || two` only run two if one fails


## conditionals

`[[ -e file ]]` file exists

`[[ -d file ]]` file is a directory


## Parameter expansion - substrings

From start

`${param#*a}`

From end

`${param%a*}`

Split at `/`

`${param%\/*}`

## Parameter expansion - pattern substitution

Similar to expansion, except using `/`

`${param/pattern/string}`


## Arithmetic

`(( do math in here ))`

