{
  programs = {
    zsh = {
      enable = true;
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

    fzf.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    zoxide.enable = true;
  };
}
