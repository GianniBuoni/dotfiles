{pkgs, ...}: let
  term = "xterm-256color";
in {
  programs = {
    alacritty = {
      enable = true;
      settings = {
        env.TERM = term;
        window = {
          padding.x = 10;
          padding.y = 10;
          blur = true;
          decorations = "None";
        };
      };
    };

    ripgrep.enable = true;
    starship.enable = true;

    tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs; [
        tmuxPlugins.power-theme
        tmuxPlugins.vim-tmux-navigator
      ];
      extraConfig = ''
        set -g default-terminal "screen-256color"
        set -ag terminal-overrides ",${term}:RGB"
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
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };

    eza.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
  };

  home.packages = with pkgs; [
    neofetch
  ];
}
