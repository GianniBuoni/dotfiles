let
  enable = true;
in {
  flake.aspects.zsh = {
    nixos.programs.zsh = {inherit enable;};

    homeManager.programs.zsh = {
      inherit enable;
      shellAliases = {
        "cd" = "z";
        "llg" = "lazygit";
        "ls" = "eza --icons=always";
        "vi" = "nvim";
        "vim" = "nvim";
        "zz" = "zellij";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
  };
}
