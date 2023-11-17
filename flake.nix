{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, disko, ... }:
    {
      nixosConfigurations.office = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ({ modulesPath, ... }: {
            imports = [
              ./disk-config.nix
            ];
            services.openssh.enable = true;
            users.users = {
              root = {
                # Post-installation, the IP might change if MAC is not the
                # only identifier used by DHCP server to lease an IP, by setting a
                # password you can find the changed IP.
                initialHashedPassword = "";
                openssh.authorizedKeys.keys = [
                  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFN5Ov2zDIG59/DaYKjT0sMWIY15er1DZCT9SIak07vK"
                ];
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
