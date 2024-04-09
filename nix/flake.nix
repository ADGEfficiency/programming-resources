{
  description = "A macOS flake for the Fish shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.fish;
    ripgrep = nixpkgs.legacyPackages.x86_64-darwin.ripgrep;
  };
}
