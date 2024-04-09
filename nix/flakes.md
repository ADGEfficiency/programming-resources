# Flakes

- Impose a standard structure on `flake.nix`.
- Remove any reliance on `nixpkgs` in tooling.
- Enforce hermetic evaluation by removing `NIX_PATH` and `builtins.currentSystem` among other things.
- Integrate tightly with other nix tooling.

## Get Started

In `$XGD_CONFIG_HOME/nix/nix.conf`:

```conf
experimental-features = nix-command flakes
```

Create a `flake.nix` and add to Git - the flake must be in Git:

```shell-session
$ nix flake init
$ git add flake.nix && git commit -m "build: init flake"
```

Update:

```
$ nix flake update nixpkgs
```

Use it

```shell-session
$ nix build
# install to system packages
$ nix profile install
```

## `flake.nix`

`flake.nix` is a file defining an attribute set with various attribute. Most notable are `description` (a string), `inputs` (an attrset) and `outputs` (a function of `inputs`).

```nix
{
  description = "<...>";
  inputs = { nixpkgs = <...>; };
  # outputs function that takes two arguments, self and nixpkgs
  outputs = { self, nixpkgs }: { <...> };
}
```

A Flake that installs the `fish` shell on macOS:

```nix
{
  description = "A macOS flake for the Fish shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.fish;
  };
}
```

You can then build this as a binary:

```shell-session
$ nix build
$ ls result/bin
fish
fish_indent
fish_key_reader
```

Or use as shell:

```shell-session
$ nix shell
```

Or install to system packages:

```shell-session
$ nix profile install
```

### Adding to the Flake

We can add more outputs:

```nix
{
  description = "A macOS flake for the Fish shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.fish;
    finders = {
        ripper = {
            nixpkgs.legacyPackages.x86_64-darwin.ripgrep;
        };
  };
}
```

This allows us to do:

```shell-session
$ nix build .#\finders.ripper
$ ./result/bin/rg -V
ripgrep 14.1.0
```

Or

```shell-session
$ nix run .#\finders.ripper
ripgrep 14.1.0
```

`./result` is a symlink to the output of the last build.

### Adding More

```nix
{
  description = "A macOS flake for the Fish shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nipkgs {system = "x86_64-darwin";};
in {
packages = {
default = pkgs.legacyPackages.x86_64-darwin.fish;
};
};
}
```

### `flake.lock`

`flake.lock` is a JSON file pinning versions and checksums of all the `inputs`.

```json
{
    "nodes": <...>,
    "root": "root",
    "version": 7
}
```

## CLI

flakes also change the interface of `nix`. Old interface (`nix-` commands) is still available for compatibility purposes.

### Old

    nix-build -A foo
    nix-shell -p foo
    nix-shell "<nixpkgs>" -A foo
    nix-env -iA nixos.foo
    nix-env -f . -iA foo
    nix-instantiate -A foo

### New

    nix build .#foo
    nix shell nixpkgs#foo
    nix develop nixpkgs#foo
    nix profile install nixpkgs#foo
    nix profile install .#foo
    nix eval .#foo



## Resources

[Matthew Croughan - Use flake.nix, not Dockerfile - MCH2022](https://youtu.be/0uixRE8xlbY?si=BWdb1lSV-3D_C1Up)

[serokell/nixcon2020-talk: NixCon 2020 talk about Nix flakes](https://github.com/serokell/nixcon2020-talk)

[Beginners Guide to Nix EP1: Flakes - YouTube](https://www.youtube.com/watch?v=IrxCiNnXG4M)
