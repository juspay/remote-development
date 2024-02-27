{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };
  outputs = inputs: {
    nixosConfigurations = {
      # TODO: Make this use disko: https://github.com/juspay/remote-development/issues/11
      vanjaram = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/vanjaram/configuration.nix

          # TODO: Refactor this using nixos-flake, and put in common.nix
          inputs.vscode-server.nixosModules.default
        ];
      };
    };
  };
}
