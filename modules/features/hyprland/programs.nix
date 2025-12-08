{
  flake.aspects.hyprland.homeManager = {
    wayland.windowManager.hyprland.settings = {
      # program variables
      "$terminal" = "ghostty";
      "$notes" = "obsidian";
      "$fileManager" = "ghostty -e yazi";
      "$menu" = "fuzzel";
      "$web" = "zen-beta";

      # program key bindings
      bind = [
        "$mod, T, exec, $terminal" # [T]erminal
        "$mod, E, exec, $fileManager" # [E]xplorer
        "$mod, F, exec, $web" # [F]irefox
        "$mod, W, killactive"
        "$mod, O, exec, $notes" # [O]bsidian
        "$mod, V, togglefloating"
        "$mod, SPACE, exec, $menu"
        "ALT, SPACE, exec, $run"
        "SHIFT, SPACE, exec, $emoji"
      ];

      exec-once = [
        "hyprpaper"
        "mako"
        "waybar"
        "[workspace 2 silent] $web"
        "[workspace 1] $terminal"
      ];
    };
  };
}
