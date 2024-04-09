{
  description = "A macOS flake for the Fish shell";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system} = {
        default = pkgs.legacyPackages.x86_64-darwin.fish;
        myPackage = self.default;
      };
    };
}
