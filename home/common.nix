# home-manager configuration common to all users
{ flake, pkgs, ... }:
{
  # Everyone uses git. But they can customize it further in their per-user
  # config.
  programs.git = {
    enable = true;
  };

  home.packages = with pkgs; [
    # FIXME: neovim should be per-user
    neovim
  ];

  # Recommended Nix settings
  nix = {
    registry.nixpkgs.flake = flake.inputs.nixpkgs; # https://yusef.napora.org/blog/pinning-nixpkgs-flake/

    # FIXME: Waiting for this to be merged:
    # https://github.com/nix-community/home-manager/pull/4031
    # nixPath = [ "nixpkgs=${flake.inputs.nixpkgs}" ]; # Enables use of `nix-shell -p ...` etc
  };

  # Let's give them a standard shell prompt.
  programs.starship = {
    enable = true;
    settings = {
      username = {
        style_user = "blue bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐 ";
        format = "on [$hostname](bold red) ";
        trim_at = ".local";
        disabled = false;
      };
    };
  };

  # https://nixos.asia/en/direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Enable bash, so the dotfiles are in use.
  programs.bash = {
    enable = true;
  };
}
