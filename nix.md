Nix is congruent - will reach the target state by constructing the target state again

# Install

```shell-session
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Nix Shell

[Tools You Should Know About: nix-shell](https://cuddly-octo-palm-tree.com/posts/2021-12-19-tyska-nix-shell/)

Initialize a project - this creates a folder `./nix`:

```shell-session
$ nix-shell -p niv --run "niv init -b nixpkgs-unstable"
```

Then create a `shell.nix` - this is Nix language for "load the definitions from nixpkgs, and build the buildInputs list.":

```nix
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in
pkgs.mkShell {
  buildInputs = [
    pkgs.bash
    pkgs.jdk8
    pkgs.terraform
  ];
}
```

Run a command:

```shell-session
$ nix-shell --run "java -version; terraform -v; bash --version"
```

Can use `--pure` to only use `buildInputs`.

Automatically use nix with direnv:

```.envrc
use nix
```

---

# Nix Files

default.nix: This is the conventional entry point for a Nix package. 

When you run a command like nix-build in a directory, it will look for a file named default.nix. This file typically defines the package itself or a package set and its dependencies.

shell.nix: This file is specifically used to define development environments. 

When you run nix-shell in a directory, it looks for a shell.nix file and builds an environment with the specified dependencies. This is handy for setting up a consistent development environment across different systems.

configuration.nix: This file is specific to NixOS, the Nix-based Linux distribution. 

It's used to define the entire system configuration, including system packages, services, file system mounts, user accounts, and more. You'll find this file at /etc/nixos/configuration.nix on a NixOS system, and changes to this file are made active by running nixos-rebuild switch.

---

## Nix shell

https://nixos.wiki/wiki/Development_environment_with_nix-shell

buildInputs = required at run time

nativeBuildInputs = required at build time

---

list install packages

nix-env -q

## with .envrc

```
#.envrc
# use nix --pure --keep DIRENV_DUMP_FILE_PATH
# use nix
```

---

## [Matthew Croughan - Use flake.nix, not Dockerfile - MCH2022](https://youtu.be/0uixRE8xlbY?si=BWdb1lSV-3D_C1Up)

## [Nix for Startups](https://youtu.be/WJZgzwB3ziE?si=TuOnYWuScxds6vNL)

---

# Flakes

[serokell/nixcon2020-talk: NixCon 2020 talk about Nix flakes](https://github.com/serokell/nixcon2020-talk)

-   Impose a standard structure on `flake.nix`.
-   Remove any reliance on `nixpkgs` in tooling.
-   Enforce hermetic evaluation by removing `NIX_PATH` and
    `builtins.currentSystem` among other things.
-   Integrate tightly with other nix tooling.

## Files

### `flake.nix`

`flake.nix` is a file defining an attribute set with various attribute. Most notable are `description` (a string), `inputs` (an attrset) and `outputs` (a function of `inputs`).

```nix
{
  description = "<...>";
  inputs = { nixpkgs = <...>; };
  outputs = { self, nixpkgs }: { <...> };
}
```

```nix
{
  inputs = {
    nixpkgs.url = "github:serokell/nixpkgs";
  };
  outputs = { self, nixpkgs }: {
    defaultPackage = builtins.mapAttrs
      (_: pkgs: pkgs.callPackage ./talk.nix { })
      nixpkgs.legacyPackages;
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

flakes also change the interface of `nix`. Old interface (`nix-` commands) is
still available for compatibility purposes.

### Old

    nix-build -A foo
    nix-shell -p foo
    nix-shell "<nixpkgs>" -A foo
    nix-env -iA nixos.foo
    nix-env -f . -iA foo
    nix-instantiate -A foo

::::

:::: column
### New

    nix build .#foo
    nix shell nixpkgs#foo
    nix develop nixpkgs#foo
    nix profile install nixpkgs#foo
    nix profile install .#foo
    nix eval .#foo

### Set up (not required, it just copies a skeleton for flake.nix to the project)

    $ nix flake init

### Update

    $ nix flake update --update-input nixpkgs
    # or
    $ nix build . --update-input nixpkgs

### Override

    $ nix flake update --override-input nixpkgs ../nixpkgs
    # or
    $ nix build . --override-input nixpkgs ../nixpkgs

## Initialize our first flake

    $ mkdir my-first-flake && cd my-first-flake
    $ nix flake init
    $ git init && git add --all # flake.nix must be in git index
    $ cat flake.nix

### `flake.nix`

```nix
{
  description = "A very basic flake";
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
  };
}
```

### Use it!

    $ nix build
