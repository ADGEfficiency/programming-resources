# fzf - fast and fuzzy search with fzf

Command line, fuzzy searcher
- important part of my terminal/shell workflow
- three use cases provide massive power to search quickly
- **local search, global search (in Vim), history search**

Default to recursively search files & folders
```bash
$ fzf
```

Can be combined with other UNIX tools in the usual ways
```bash
$ cat ~/git/cc-youtube-channel/fzf.md | fzf
```

Control search using familiar regex patterns
- `python`
- `^python` starts with
- `python$` ends with
- `!python`
- multiple matches with `TAB`
- `> data.file` redirect the output to a file

Customization
```bash
fzf --multi
fzf --height 40%
fzf --layout=reverse
fzf --preview 'head -100 {}'
fzf --preview 'bat --style=numbers --color=always {} | head -100'
```

See my config:
```
sed -n '/FZF/ p' ~/git/dotfiles/.zshrc
```

## Using fzf in my workflow

1. find local files (project files)
2. find any file, from anywhere (incl. Vim)
3. fuzzy search terminal history

1. find local files
- `**<TAB>` syntax 
- `/**`
- `~/**`
- `../**`
- `vi **`, `nano **`, `atom **`, `code **`
- `cp`, `mv`



## Using fzf in my workflow

1. find local files (project files)
2. find any file, from anywhere (incl. Vim)
3. fuzzy search terminal history

2. find any file, from anywhere (incl. Vim)

Can use the space key to find any file.

Setup fzf in `vimrc`:

`sed -n '/fzf/ p' ~/git/dotfiles/.vimrc | grep -v '^"'`

Setup the space hotkey:
`sed -n '/:Files/ p' ~/git/dotfiles/.vimrc`



3. fuzzy search history

Binds to `<C-r>`

`sed -n '/HIST/ p' ~/git/dotfiles/.zshrc`
