# Yabai

See titles of open windows:

```shell
$ yabai -m query --windows | jq ".[] | { App: .app, Title: .title }"
```

man yabai - https://github.com/koekeishiya/yabai/blob/master/doc/yabai.asciidoc#config

wiki - https://github.com/koekeishiya/yabai/wiki

## Configs

https://digitalblake.com/2021/08/27/yabai-and-skhd-configs/

https://github.com/julian-heng/yabai-config/blob/master/skhdrc
- TODO look at navigation + moving windows

https://jasoneckert.github.io/myblog/customizing-macos-for-development/skhdrc.txt

https://d12frosted.io/posts/2022-04-23-yabai-spaces.html
- automated space setup
