{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    nixosConfigurations = {
      # TODO: Make this use disko
      vanjaram = inputs.nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/vanjaram/configuration.nix ];
      };
    };
  };
}
