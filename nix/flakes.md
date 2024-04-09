# Flakes

-   Impose a standard structure on `flake.nix`.
-   Remove any reliance on `nixpkgs` in tooling.
-   Enforce hermetic evaluation by removing `NIX_PATH` and
    `builtins.currentSystem` among other things.
-   Integrate tightly with other nix tooling.

## Get Started

In `$XGD_CONFIG_HOME/nix/nix.conf`:

```conf
experimental-features = nix-command flakes
```

Create a `flake.nix`:

```shell-session
$ nix flake init
```

Update:

```
$ nix flake update nixpkgs
```

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

### New

    nix build .#foo
    nix shell nixpkgs#foo
    nix develop nixpkgs#foo
    nix profile install nixpkgs#foo
    nix profile install .#foo
    nix eval .#foo

### Set up (not required, it just copies a skeleton for flake.nix to the project)

```shell-session
$ nix flake init
```

### Update
```shell-session
$ nix flake update nixpkgs
# or
$ nix build . --update-input nixpkgs
```

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


## Resources

[Matthew Croughan - Use flake.nix, not Dockerfile - MCH2022](https://youtu.be/0uixRE8xlbY?si=BWdb1lSV-3D_C1Up)

[serokell/nixcon2020-talk: NixCon 2020 talk about Nix flakes](https://github.com/serokell/nixcon2020-talk)
