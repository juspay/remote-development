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
        hostname = "100.92.110.74"; # Tailscale IP belongs to separate Tailscale account with gmail login shared between Faisal & Shivaraj
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
        program = nixpkgs.lib.getExe deploy-rs.packages.x86_64-linux.deploy-rs;
      };
    };
    nixosConfigurations.nixos-remote-01 = nixpkgs.lib.nixosSystem {
      modules = [
        disko.nixosModules.disko
        ./nix/configuration.nix
        {
          nixpkgs.hostPlatform = "x86_64-linux";
        }
      ];
    };
  };
}
