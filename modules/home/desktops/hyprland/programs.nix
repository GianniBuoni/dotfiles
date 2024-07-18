{systemSettings, ...}: {
  wayland.windowManager.hyprland.settings = {
    # ----- PROGRAM VARIABLES ----- #
    "$terminal" = "kitty";
    "$fileManager" = "kitty -e yazi";
    "$menu" = "rofi -show drun";
    "$run" = "rofi -show run";
    "$web" = "firefox";
    "$dotfiles" = "kitty -e ddo";

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
      "ALT, SPACE, exec, $run"
    ];

    exec-once =
      [
        "hyprpaper & waybar & mako"
        "[workspace 2 silent] $web"
      ]
      ++ (
        if (systemSettings.formFactor == "laptop")
        then ["dds && $dotfiles"]
        else ["dds"]
      );
  };
}
