# Nix

Nix is congruent - will reach the target state by constructing the target state again

## Install

```shell-session
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Search

```shell-session
$ nix search nixpkgs emulator
```

## Nix Files

### default.nix

This is the conventional entry point for a Nix package. 

When you run a command like nix-build in a directory, it will look for a file named default.nix. This file typically defines the package itself or a package set and its dependencies.

### shell.nix 

This file is specifically used to define development environments. 

When you run nix-shell in a directory, it looks for a shell.nix file and builds an environment with the specified dependencies. This is handy for setting up a consistent development environment across different systems.

### configuration.nix 

This file is specific to NixOS, the Nix-based Linux distribution. 

It's used to define the entire system configuration, including system packages, services, file system mounts, user accounts, and more. You'll find this file at /etc/nixos/configuration.nix on a NixOS system, and changes to this file are made active by running nixos-rebuild switch.

## Resources

[Nix for Startups](https://youtu.be/WJZgzwB3ziE?si=TuOnYWuScxds6vNL)
