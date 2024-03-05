## Using Secret Env Files

```
source_env_if_exists .envrc.secret
```

## Using Nix

```
# .envrc

use nix
use nix --pure --keep DIRENV_DUMP_FILE_PATH
```

[Cuddly, Octo-Palm Tree: Tools You Should Know About: direnv](https://cuddly-octo-palm-tree.com/posts/2021-12-12-tyska-direnv/)

direnv is an extension for your shell. 

It augments existing shells with a new feature that can load and unload environment variables depending on the current directory.
