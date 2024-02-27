{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, deploy-rs, ... }: {
    deploy.nodes = {
      vanjaram = {
        hostname = "vanjaram"; # Tailscale IP belongs to separate Tailscale account with gmail login shared between Faisal & Shivaraj
        sshUser = "srid";
        profiles.system = {
          user = "srid";
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
    nixosConfigurations = {
      # TODO: Make this use disko
      vanjaram = nixpkgs.lib.nixosSystem ./hosts/vanjaram/configuration.nix;
    };
  };
}
