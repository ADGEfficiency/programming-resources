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

Vimscript all plugins work fine in Neovim.

If you want a good place to start, look at [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) or [nvim-kickstart-python/kickstart-python.lua](https://github.com/chrisgrieser/nvim-kickstart-python/blob/main/kickstart-python.lua) for Python.

# Options

[Configure Neovim with Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

[nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)

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

## Example Configs

https://github.com/dmmulroy/kickstart.nix/tree/main/config/nvim

https://github.com/mischavandenburg/dotfiles/tree/main/nvim

https://github.com/exosyphon/nvim

https://github.com/takadev15/dotfiles/tree/master/.config/nvim

http://www.lazyvim.org/plugins

https://github.com/folke/lazy.nvim

https://github.com/LongerHV/nixos-configuration/tree/0d3e9c174c08afb9cad1440c509e5bfbf931f7c1/dotfiles/nvim/lua/config

https://github.com/LukasPietzschmann/nvim-config/tree/master

## Lists of Linting & Formatting Tools

[efm-langserver](https://github.com/mattn/efm-langserver),

[efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim/blob/main/supported-linters-and-formatters.md),

[Null LS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md),

[conform](https://github.com/stevearc/conform.nvim#formatters),

[nvim-lint](https://github.com/mfussenegger/nvim-lint#available-linters).

## Creating Plugins

[Developing a Neovim Docker Plugin from Scratch](https://www.youtube.com/watch?v=HXABdG3xJW4)

## Resources

[Can someone explain me why the config table doesn't work inside the "opts" table?](https://www.reddit.com/r/neovim/comments/1barpx5/whichkeynvim_can_someone_explain_me_why_the/?share_id=ExbL8Hb7xuIJ0DUdEfUp_&utm_name=androidcss)

When config is not present, and opts is, Lazy calls the plugin’s setup automatically, passing opts as the argument. If you want to use both, you need to call setup inside config yourself, passing the options. Lazy passes opts as the second argument of config, so you can then just call require(‘myplugin’).setup(opts). 

[Confusion with NeoVim's API : r/neovim](https://www.reddit.com/r/neovim/comments/1b9zg0z/confusion_with_neovims_api/?share_id=9ecGfoQYp3MIA2d2rkYk1&utm_name=androidcss)

    vim.keymap.set() vs vim.api.nvim_set_keymap()

    vim.o. vs vim.opt. vs api.nvim_set_option_value()

Could somebody please explain the difference to me? 

---

The API (:h api) predates Lua support, and it is intended to be a stable interface to Neovim that you can user over RPC. What this means is that you can call all the API functions from outside Neovim. This is important for remote plugins; you could write a plugin in Python using pynvim that runs inside a separate Python process. Under the hood the pynvim library sends RPC messages to Neovim targeting the API.

You can use the API from inside Neovim as well, but it is pretty awkward. Hence why we now have more "native" feeling Lua functions.

As for vim.o VS vim.opt, they differ in minor details when an option is a list or map.

With that said, there is still some redundancy between Vim script and Lua. For example, we have vim.split (Lua) and split (Vim script). I don't know why we need two string-splitting functions.
