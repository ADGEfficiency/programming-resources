# Getting Setup

Core file is:

```
~/.config/nvim/init.lua
```

Use Packer to manage packages:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
:PackerInstall
```

Vimscript all plugins work fine in Neovim

#  Options 

[Configure Neovim with Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

## Set Options in Vimscript

```
set tabstop=2
set booleanoption
unset booleanoption
```

# Set Options in Lua
```
vim.opt.set.tabstop = 2
vim.cmd "set tabstop=2"
```

# Set Options in Commandline

```
#  set value
:set tabstop=2

#  check value
:set tabstop?

#  unset
:set tabstop=

#  reset
:set tabstop&
```

## Variables

```
#  set variable in vimscript
let g:zoom#statustext = 'Z'

#  set variable in lua
vim.g['zoom#statustext'] = 'Z'

#  check value on vim command line
:echo g:zoom
```
