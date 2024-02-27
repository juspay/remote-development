{ pkgs, lib, ... }:

let
  users = import ../../nix/users.nix;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Shared modules
    ../../nixos/common.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "vanjaram";

  users.users =
    lib.flip lib.mapAttrs users (name: cfg: {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      openssh.authorizedKeys.keys = cfg.pubKeys;
    });

  home-manager.users =
    lib.flip lib.mapAttrs users (name: cfg: {
      imports = [
        ../../home/commmon.nix
      ];
      home.stateVersion = "23.11";
    });


  system.stateVersion = "23.11";
}
