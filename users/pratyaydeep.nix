{
  pubKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJy9su5dEynBaE9vLIG3ErYWHfu2rArtGVhUHOMHGhnYou/F3hd6uifgcWsXO4xZbs/2sXOHHZsvfifOoI3lJClEiyC4LA1lhs3Bpa02B/K0fRKhaiYOgBwNAOMz7kb1VX+x2oYELBXclStZ3TgTbES168YJFsR0Yc04F0gFyHXQHlqnORAYhCtygAjMh4GjG0DQl11M4w1r2h3MQf9YWRNcPJKzpCfpqbXfjNyPEd3MUBkex16g9rBmS1rdtWJZ1YXR8glO7mj0aB2LXYqpnLazlai7e9fn7TK5g+gGI6/vWBBtIvwORpvgaMRYxrbrmIhYqZjRNlAwt24YqDelOHv2O9A5EUS8sdcqaxgtMlJqku1NJAWN6uoNn7q95llhOrw80wQHv8e8MCEoGQfyrntxGN7rz07xOOsPTlylTGmE0Vhcykb0aDNfi67sHto6okXbmzAsGWMz/tzCeK4DgFA1+co26mbxXSeVEyOTOqsca1nhFXwqMenWlnbsUQh9SSChNPR0l45h1MHz3ubNoIPbito+xsCWsVOcQFz93rfo3DML/CsuBQkQ3bS6mpOrcVAyGmOvVDSqMHaXKgP4NIYmk3VkbxD3zrEQo3i77chLSiOGLZWMJTK9FoKKIUl15aPoAJQB2vXofb5vmwY0pnA4dOSO+OC6DL0x+mVdb5SQ== pratyaydeep.ghanta@juspay.in"
  ];

  homeModule = { pkgs, lib, ... }: {
    programs.git = {
      userName = "Pratyaydeep";
      userEmail = "pratyaydeep.ghanta@juspay.in";

    };

    programs.bat.enable = true;
    programs.zoxide.enable = true;
    programs.lazygit = {
      enable = true;
    };
  };
}
