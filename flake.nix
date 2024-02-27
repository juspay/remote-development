{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      imports = [ inputs.nixos-flake.flakeModule ];
      perSystem = { pkgs, ... }: {
        formatter = pkgs.nixpkgs-fmt;
      };
      flake = {
        nixosConfigurations = {
          # TODO: Make this use disko: https://github.com/juspay/remote-development/issues/11
          vanjaram = inputs.nixpkgs.lib.nixosSystem {
            modules = [ ./hosts/vanjaram/configuration.nix ];
          };
        };
      };
    };
}
