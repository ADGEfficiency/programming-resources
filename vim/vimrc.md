# Options

tabstop - Number of spaces that <Tab> in the file counts for.
shiftwidth - Number of spaces to use for each step of (auto)indent.
Shiftwidth applies to =, >, and <

# Vimscript

From [idiomatic-vimrc](https://github.com/romainl/idiomatic-vimrc)

[A Good Vimrc](https://dougblack.io/words/a-good-vimrc.html)

[Vim Setup for Markdown](https://www.swamphogg.com/2015/vim-setup/)

[vim colors](http://vimcolors.com/)

[Vim Script for Python Developers](https://gist.github.com/yegappan/16d964a37ead0979b05e655aa036cad0)

[Vim Script for the JavaScripter](https://w0rp.com/blog/post/vim-script-for-the-javascripter/)

[Reorganizing my vimrc](https://blog.djy.io/reorganizing-my-vimrc/)

##  Set global, window & buffer settings

See [Configure Neovim with Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

```
# vimscript
set tabstop=2

set booleanoption
unset booleanoption

#  lua
vim.opt.set.tabstop = 2

vim.cmd "set tabstop=2"

:set tabstop=2
```

## Check current value

```
:set tabstop?
```

## Unset

```
:set tabstop=
```

## Reset
```
:set tabstop&
```
