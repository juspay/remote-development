{ pkgs, lib, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vanjaram"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
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

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  security.sudo.wheelNeedsPassword = false;

  services.tailscale.enable = true;
  services.openssh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = 
    let 
      users = import ../../nix/users.nix;
    in 
      lib.flip lib.mapAttrs users (name: cfg: {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
        openssh.authorizedKeys.keys = cfg.pubKeys;
      });

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  system.stateVersion = "23.11";
}
