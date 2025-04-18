{pkgs, ...}: {
  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      shell = "${pkgs.zsh}/bin/zsh";
      plugins = with pkgs.tmuxPlugins; [
        power-theme
        session-wizard
        vim-tmux-navigator
      ];
      terminal = "xterm-ghostty";
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
        "llg" = "lazygit";
        "ls" = "eza --icons=always";
        "t" = "tmux";
        "vi" = "nvim";
        "vim" = "nvim";
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
