https://www.reddit.com/r/vim/comments/ae8tnp/i_know_vim_fu/

https://mkaz.blog/code/working-with-vim/

https://www.reddit.com/r/vim/

[Talk on going mouseless with Vim, Tmux, and Hotkeys](https://www.youtube.com/watch?v=E-ZbrtoSuzw)

[Why I Still Use Vim](https://medium.com/commitlog/why-i-still-use-vim-67afd76b4db6)

### History 

https://twobithistory.org/2018/08/05/where-vim-came-from.html

## Why Vim

It's everywhere
- all unix platforms

Customizable

Fast & lightweight

Same dev environment on remote and local machine

Very efficient at **editing text**
- language for editing text

### Vim is everywhere

Using vim keys on the 
- terminal
- less
- git diff
- man pages

### Vim manifesto

Vim is **optimized for repetition**
- repetition is the problem - Vim is the cure

One key to move, one key to change
- `/word` `.` `n` `.`
- independent commands allows skipping and reversing

Make the change repeatable

Act, repeat, reverse

## Modal editor

Normal

Insert

Visual

Command-line (aka ex)

### Moving text around

Using `dd p` to transpose line

### Macros

Running macro n times
- example of replacing a '- ' in front of each line

Operators, text objects and motions

Operator + text object
Operator + motion
Motion on it's own

[count][operator][text object OR motion]

## Operators

Action performed text - verbs

`c` change
`d` delete
`y` yank
`a` append

`g~` swap case
`gu` upper case
`gU` upper case

`<` shift left
`>` shift right

## Motions

Motions to select / move over text

`_` current line
`0` start of line
`^` first character on line
`$` end of line

`G` to to line
`gg` top of file
`GG` bottom of file

`w`
`e`
`b`

`W, E, B` includes whitespace

`ge` backwards to end of word

`%` go to matching bracket

`( )` sentences
`{ }` paragraphs

`f{char}` find char
`F{char}` find char (backwards)

`t{char}` until char
`T{char}` until char (backwards)

Move cursor around screen
`H`
`M`
`L`

Move screen around cursor
`zb` 
`zz` 
`zt` 

### Text objects

`aw` a word
`at` a tag
`it` inner tag
`ap` paragraph

## The dot command

Repeats

## Useful patterns

`ea` append to end of word

`ciw` change word (better than cw because you can dot command it anywhere in another word)

## Searching

`/{pattern}`

`*` highlight search

`gd` go to definition

## Marks

`ma`

`a`

## Going backward

`u` undo

`ctrl-r` redo

`ctrl-o ctrl-i` cycle through jumps

`g; g,` cycle through changes

## Buffers

Buffer is a history

```
:bn next buffer
:buffers show all buffers
:b {filename}
```

Windows = views onto buffers

```
ctrl-w r  rotate
```
