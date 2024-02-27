# Configuration common to all hosts
{ pkgs, lib, ... }:

{
  # Some machines may not have ethernet.
  networking.networkmanager.enable = true;

  # Location: India
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Important Nix settings
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Remote access
  # - SSH through tailscale
  # - Allow passwordless sudo for all in 'wheel'
  security.sudo.wheelNeedsPassword = false;
  services.tailscale.enable = true;
  services.openssh.enable = true;

  # For VSCode SSH remote
  services.vscode-server.enable = true;
}
