{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, disko, deploy-rs, ... }: {
    deploy.nodes = {
      nixos-remote-01 = {
        # local network IP
        hostname = "10.10.69.221";
        sshUser = "root";
        profiles.system = {
          user = "root";
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.nixos-remote-01;
        };
      };
    };
    apps."x86_64-linux" = {
      # Deploy
      default = {
        type = "app";
        program = nixpkgs.lib.getExe deploy-rs;
      };
    };
    nixosConfigurations.nixos-remote-01 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./nix/configuration.nix
      ];
    };
  };
}
