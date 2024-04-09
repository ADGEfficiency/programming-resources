## Nix Shell

create a `shell.nix` - this is Nix language for "load the definitions from nixpkgs, and build the buildInputs list.".

buildInputs = required at run time

nativeBuildInputs = required at build time

```nix
```

Run a command:

```shell-session
```

Can use `--pure` to only use `buildInputs`.

Automatically use nix with direnv:

```.envrc
use nix
use nix --pure --keep DIRENV_DUMP_FILE_PATH
```

## Resources

https://nixos.wiki/wiki/Development_environment_with_nix-shell

[Tools You Should Know About: nix-shell](https://cuddly-octo-palm-tree.com/posts/2021-12-19-tyska-nix-shell/)
