# Vim

## Why Vim?

Highly customizable and extensible - vast ecosystem of plugins.

Fast & lightweight.

Efficient at **editing text**.

### Vim is Everywhere

The `vim` text editor & key bindings are everywhere - all Unix platforms have it installed.

Vim bindings are available in:

- terminal,
- `less`,
- `git diff`,
- `man` pages,
- Vim & Neovim.

Can enable Vim bindings in the shell with:

```shell-session
$ set -o vi
```

## Should You Learn Vim?

Using Vim or Neovim as your main text editor is a niche choice - not for everyone.

It is for the people who enjoy configuring and customizing their tools.

Even if Vim isn't your main text editor, a basic understanding of Vim is useful for working on remote machines.

## History

Vim's history stretches back more that 50 years - [History and effective use of Vim](https://begriffs.com/posts/2019-07-19-history-use-vim.html):

```
1966 : QED (“Quick EDitor”) in Berkeley Timesharing System
1969 Jul: moon landing (just for reference)
1969 Aug: QED -> ed at AT&T
1976 Feb: ed -> em (“Editor for Mortals”) at Queen Mary College
1976 : em -> ex (“EXtended”) at UC Berkeley
1977 Oct: ex gets visual mode, vi

nvi - 1980 for 4BSD
calvin - 1987 for DOS
vile - 1990 for DOS
stevie - 1987 for Atari ST
elvis - 1990 for Minix and 386BSD
vim - 1991 for Amiga
viper - 1995 for Emacs
elwin - 1995 for Windows
lemmy - 2002 for Windows

Neovim - 2014
```

## The Vim Manifesto

Vim is **optimized for repetition** - if repetition is the problem, Vim is the cure.

One key to move, one key to change - independent commands allows skipping and reversing. Act, repeat, reverse.

The `.` character will repeat the last change.

Make the change repeatable.

## Modal Editor

Normal mode - for moving around a file & editing text.

Insert mode - for writing text.

Visual mode - for selecting blocks of text.

Command-line (aka ex) - for running commands.

## Actions, Motions, Operators

**Action** and **motion**:
- action = does something,
- motion = moving cursor.
 
Command + text objects or motion - can have number before command.

## Operators

Actions performed on text - verbs:

`c` change
`d` delete
`y` yank
`a` append

`d` delete by motion
`c` change by motion & go into insert
`r` replace
`s` delete and go to insert mode
`y` yank by motion
`<` indent
`v` visually select
`y` yank (copy)


`g~` swap case
`gu` upper case
`gU` upper case

`<` shift left
`>` shift right

## Objects

Operators are - performed on objects:

`aw` a word
`at` a tag
`it` inner tag
`ap` paragraph

`w` words
`s` sentences
`p` paragraphs 
`t` tags (HTML)

## Motions

Motions to select / move over text:

`_` current line
`0` start of line
`^` first character on line
`$` end of line

`G` to to line
`gg` top of file
`GG` bottom of file

`a` all 
`i` in
`$` end of line
`G` end of file
`f.` go to next occurrence of . on line

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

### Examples of Motions & Operators

`yi)` yank inside )
`da)` delete incl brackets 
`dt` space delete until space
`df` space delete incl space

`iw` everything in current word
`it` everything in tag
`i{` everything inside {}

`diw` delete inside word
`di”` delete inside “
`dip` delete inside paragraph
`das` delete sentence 
`dit` delete inner tag

(F T ? go backwards)
f F find next character
t T find but goes up to not include char
/ ?

c /word change up until word

## Working with Files

Buffer = in memory text of a file.

Window = viewport onto a buffer.

Tab page = collection of windows.

### Moving Around a Buffer

`g;` go back to last change `g,`

`f` inclusive find
- `;` = move fwd after F
- `,` = move backward

`t` exclusive find

` ( ) ` move sentences
` { } ` move paragraphs

### Moving Text Around

Using `dd p` to transpose line

`d0` delete to start of line

`0D` clear line (without removing it)

`J` join line below

## Macros

Running macro n times
- example of replacing a '- ' in front of each line

Operators, text objects and motions

Operator + text object
Operator + motion
Motion on it's own

[count][operator][text object OR motion]

## Useful patterns

`ea` append to end of word

`ciw` change word (better than cw because you can dot command it anywhere in another word)

## Searching

`/{pattern}`

`*` highlight search

`gd` go to definition

## Marks

`ma` set mark a
`mz` set mark z

## Going backward

`u` undo

`ctrl-r` redo

`ctrl-o ctrl-i` cycle through jumps

`g; g,` cycle through changes

## Saving files

`:w`

`:save` write and change to the new file

`:wa` save all buffers and panes

## Shortcuts

Leader key

## Shell

`:.w !bash` write buffer text into command 
`:. !bash` run line in terminal and replace  
`:r !ls` read output of commands into buffer 
`:.w !bash` run line in terminal
`:. !bash` run line in terminal and replace

## Ex Mode

ex commands
`p` print
`d` delete
`s` substitute ie `:%/replace/with/`

`m` move
`6m.` move line 6 to current
`'<,'>m$` move line to end of file

`t` copy
`6t.` copy line 6 to current
`.t6` copy current to line 6
`t.` duplicate current line

ex ranges
`2` select line 2
`.,$` current line to bottom of file
`%` whole file

`'<` start of visual selection
`'>` end of visual selection
can get these by `:` when in visual selection
