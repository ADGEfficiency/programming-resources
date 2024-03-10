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
