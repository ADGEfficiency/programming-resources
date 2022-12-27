## https://linuxhint.com/customizing-status-bar-tmux/

Put
```
set -g status-justify centre
```

```
set-option -g status-style fg=white,bg=black
```

colors
- black, red, blue, green, white, yellow, magenta, cyan
- bright colors - brightgreen, brightred etc
- 256 colors - color0 -> color255
- hexadecimal color codes

## https://medium.com/hackernoon/customizing-tmux-b3d2a5050207

window display

set -g window-status-format <options>

set -g status-left <options>
set -g status-right <options>

Using shell scripts

options = #(path/to/script.sh)
