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
                openssh.authorizedKeys.keys = [
                  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFN5Ov2zDIG59/DaYKjT0sMWIY15er1DZCT9SIak07vK"
                  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJnwODoZ7J2O+uCkYUpBb45kWxF5FITXJtzyXy02S3Aj"
                ];
              };
              faisal = {
                openssh.authorizedKeys.keys = [
                  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJnwODoZ7J2O+uCkYUpBb45kWxF5FITXJtzyXy02S3Aj"
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
