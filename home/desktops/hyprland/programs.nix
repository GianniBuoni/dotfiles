{pkgs, ...}: let
  sn = "dotfiles";
  dotfiles-session = pkgs.writeShellScriptBin "dotfiles-session" ''
    cd ~/${sn}
    tmux new-session -d -s "${sn}"
    tmux new-window -t "${sn}" -n "nvim"
    tmux send-keys -t "${sn}:nvim" "nvim" Enter
  '';
  dotfiles-open = pkgs.writeShellScriptBin "dotfiles-open" ''
    tmux attach -t "${sn}"
  '';
in {
  home.packages = [
    dotfiles-session
    dotfiles-open
  ];
  wayland.windowManager.hyprland.settings = {
    # ----- PROGRAM VARIABLES ----- #
    "$terminal" = "kitty";
    "$fileManager" = "kitty -e yazi";
    "$menu" = "rofi -show drun";
    "$web" = "firefox";
    "$dotfiles" = "kitty -e dotfiles-open";

    # ----- PROGRAM KEYBINDINGS ----- #
    bind = [
      "$mod, T, exec, $terminal" # [T]erminal
      "$mod, E, exec, $fileManager" # [E]xplorer
      "$mod, F, exec, $web" # [F]irefox
      "$mod, D, exec, $dotfiles"
      "$mod, W, killactive"
      "$mod, M, exit"
      "$mod, V, togglefloating"
      "$mod, SPACE, exec, $menu"
    ];

    # --- AUTOSTART --- #
    exec-once = [
      "hyprpaper & waybar & mako & dotfiles-session"
      "[workspace 2 silent] $web"
    ];
  };
}
