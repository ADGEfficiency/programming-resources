## Where am I?

Which directory am I in?

`pwd`

What is in this directory?

`ls`

`-a` show hidden files
`-G` colorized
`-l` long format
`-r` reverse order 
`-t` sort by time

`tree`
`-L {num}`

## Changing directories

`cd`

Getting to highest level folders by `cd /etc`, `cd /Users`

Going to the home folder (`/Users/adam`)

`cd ~`

## What is in this file?

`cat`

`head`

`tail`

`less` - uses vim bindings

## Making new stuff

`mkdir`
`-p` recursive

`touch myfile.txt`

## Getting faster

Up and down arrows

`!python` - rerun last command for program

`history`

`<C-r>` history

`!head`

## Working with data

Select second column from a csv

`cat myfile.txt | cut -f 2 -d ,`

`-f` fields (aka columns)
`-d` delimiter

Get unique values (`uniq` will only consolidate entries right after each other)

`cat my_file.txt | cut -f 2 | sort | uniq -c`

Sort by counts

`cat my_file.txt | cut -f 2 | sort | uniq -c | sort -k1,1nr`

`-k1,1` sort using column 1
`-n` numerically
`-r` reverse

## Setting variables

`zz=1`

If I want to use this variable 

`echo $zz`

`env` is the equivalent of `dir()` in Python

## Aliases (do with bashrc)

"ls" to run without alias expansion

Useful alises

`ls stuff`

`bashrc, vimrc`
