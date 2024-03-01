{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";

    vscode-server.url = "github:nix-community/nixos-vscode-server";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixci.url = "github:srid/nixci";
  };
  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      imports = [ inputs.nixos-flake.flakeModule ];
      perSystem = { pkgs, self', ... }: {
        formatter = pkgs.nixpkgs-fmt;
        packages.default = self'.packages.activate; # Enables `nix run`
      };
      flake = {
        nixosConfigurations = {
          # TODO: Make this use disko: https://github.com/juspay/remote-development/issues/11
          vanjaram = self.nixos-flake.lib.mkLinuxSystem
            ./hosts/vanjaram/configuration.nix;
        };
      };
    };
}
