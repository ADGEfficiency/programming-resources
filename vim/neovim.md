[Configure Neovim with Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

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

Vimscript plugins work fine in Neovim
