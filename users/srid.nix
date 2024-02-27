{
  pubKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQRxPoqlThDrkR58pKnJgmeWPY9/wleReRbZ2MOZRyd"
  ];

  homeModule = { pkgs, lib, ... }: {
    programs.git = {
      userName = "Sridhar Ratnakumar";
      userEmail = "srid@srid.ca";
      aliases = {
        co = "checkout";
        ci = "commit";
        cia = "commit --amend";
        s = "status";
        st = "status";
        b = "branch";
      };

    };

    home.shellAliases = {
      g = "git";
      lg = "lazygit";
    };

    programs.lazygit = {
      enable = true;
    };
  };
}
