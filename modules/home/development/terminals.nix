{pkgs, ...}: {
  programs = {
    kitty = {
      enable = true;
      settings = {
        window_padding_width = 10;
        confirm_os_window_close = 0;
      };
    };

    tmux = {
      enable = true;
      clock24 = true;
      shell = "${pkgs.zsh}/bin/zsh";
      plugins = with pkgs; [
        tmuxPlugins.power-theme
        tmuxPlugins.vim-tmux-navigator
      ];
      extraConfig = ''
        set-option -g mouse on
        set-option -g status-position top
        set -g base-index 1
        setw -g pane-base-index 1
        set-option -g renumber-windows on
      '';
    };

    zsh = {
      enable = true;
      shellAliases = {
        "cd" = "z";
        "ls" = "eza --icons=always";
        "pn" = "pnpm";
        "vi" = "nvim";
        "vim" = "nvim";
        "yy" = "yazi";
        "llg" = "lazygit";
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

  home.packages = with pkgs; [
    neofetch
    tree
  ];
}
