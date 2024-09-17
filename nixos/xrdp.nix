# Useful when a dev requires graphical desktop.
#
# Use Microsoft Remote Desktop app to connect from mac.
#
# https://nixos.wiki/wiki/Remote_Desktop#RDP
{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };

  services.displayManager.sddm.enable = true;

  services.xrdp = {
    enable = true;
    defaultWindowManager = "startplasma-x11";
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    brave
  ];
}
