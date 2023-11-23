{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, disko, deploy-rs, ... }:
    let
      users = import ./nix/users.nix;
    in
    {
      deploy.nodes = {
        nixos = {
          hostname = "100.92.110.174"; # Tailscale IP
          sshUser = "root";
          profiles.system = {
            user = "root";
            path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.office;
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
      nixosConfigurations.office = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ({ modulesPath, ... }: {
            imports = [
              ./disk-config.nix
            ];
            services.openssh.enable = true;
            services.tailscale.enable = true;
            users.users = {
              root = {
                openssh.authorizedKeys.keys = [
                  users.shivaraj.pubKey
                  users.faisal.pubKey
                ];
              };
              faisal = {
                openssh.authorizedKeys.keys = [
                  users.faisal.pubKey
                ];
                isNormalUser = true;
              };
            };
            boot.loader.grub = {
              # adding devices is managed by disko
              # devices = [ ];
              efiSupport = true;
              efiInstallAsRemovable = true;
            };
            system.stateVersion = "23.11";
          }
          )
        ];
      };
    };
}
