{
  flake.aspects.hyprland.homeManager = {
    wayland.windowManager.hyprland.settings = {
      # program variables
      "$terminal" = "ghostty";
      "$notes" = "obsidian";
      "$fileManager" = "ghostty -e yazi";
      "$menu" = "fuzzel";
      "$web" = "zen-beta";
      "$emoji" = "bemoji -t";

      # program key bindings
      bind = [
        "$mod, T, exec, $terminal" # [T]erminal
        "$mod, E, exec, $fileManager" # [E]xplorer
        "$mod, F, exec, $web" # [F]irefox
        "$mod, O, exec, $notes" # [O]bsidian
        "$mod, W, killactive"
        "$mod, V, togglefloating"
        "$mod, SPACE, exec, $menu"
        "ALT, SPACE, exec, $emoji"
      ];

      exec-once = [
        "hyprpaper"
        "mako"
        "waybar"
        "[workspace 1] $web"
        "[workspace 2] $terminal"
      ];
    };
  };
}
