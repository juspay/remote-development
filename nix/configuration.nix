{ ... }:
let
  users = import ./users.nix;
in
{
  imports = [
    ./disk-config.nix
  ];
  networking.hostName = "nixos-remote-01";
  services.openssh.enable = true;
  services.tailscale.enable = true;
  users.users = {
    root = {
      openssh.authorizedKeys.keys = [
        users.shivaraj.pubKey
        users.srid.pubKey
      ];
    };
    srid = {
      openssh.authorizedKeys.keys = [
        users.srid.pubKey
      ];
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
    shivaraj = {
      openssh.authorizedKeys.keys = [
        users.shivaraj.pubKey
      ];
      isNormalUser = true;
      extraGroups = [ "wheel" ];
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
