```
$ nvim
```

~/.config/nvim/init.lua

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

:PackerInstall

---

nvim from scratch - 1 - options

https://www.youtube.com/watch?v=hY5-Q6NxQgY&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=2

options and commands

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"

---

rm ~/.local/share/nvim/site

pip install pynvim
npm i -g neovim

---

TODO plugins

- argwrap 
- winresizer

NOTES new shortcuts


km("n", "<silent><leader>o", ":Lex 30", opts)

NOTES https://youtu.be/gd_wapDL0V0
vimscript plugins work fine in neovim

all repos with lua directories inside them

settings for something like packer are passed to `packer.init` in plugins.lua

can do lazy loading there [RnR] - use `opt` directory and only load when some commands are run (ALE only ceratin file types etc)

NOTES https://youtu.be/RtNPfJKNr_8 - colorschemes

---

NOTES https://youtu.be/GuIcGxYqaQQ

snippets

being able to tab through them

ctrl-space = to show all completions without prompt
ctrl-e = to abort

- https://github.com/aspeddro/cmp-pandoc.nvim
- https://github.com/andersevenrud/cmp-tmux
- https://github.com/zbirenbaum/copilot-cmp

---

NOTES https://youtu.be/6F3ONwrCxMg lsp

`:LSPInstallInfo`
`:LSPInfo`

`gl` to show error message - this is a custom message from `lsp.handlers`

https://www.schemastore.org/json/


NOTES https://www.youtube.com/watch?v=vJAmjAax2H0&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=16 - buffers

NOTES - https://youtu.be/b7OguLuaYvE - null-ls

LEARN - to learn stuf

`FzfLua gitfiles` - all the git stuff from fzf.lua
