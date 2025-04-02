{systemSettings, ...}: {
  wayland.windowManager.hyprland.settings = {
    # ----- PROGRAM VARIABLES ----- #
    "$terminal" = "ghostty";
    "$fileManager" = "ghostty -e yazi";
    "$menu" = "rofi -show drun";
    "$run" = "rofi -show run";
    "$emoji" = "rofi -modi emoji -show emoji";
    "$web" = "firefox";

    # ----- PROGRAM KEYBINDINGS ----- #
    bind = [
      "$mod, T, exec, $terminal" # [T]erminal
      "$mod, E, exec, $fileManager" # [E]xplorer
      "$mod, F, exec, $web" # [F]irefox
      "$mod, W, killactive"
      "$mod, M, exit"
      "$mod, V, togglefloating"
      "$mod, SPACE, exec, $menu"
      "ALT, SPACE, exec, $run"
      "SHIFT, SPACE, exec, $emoji"
    ];

    exec-once =
      [
        "hyprpaper & waybar & mako"
        "[workspace 2 silent] $web"
      ]
      ++ (
        if (systemSettings.formFactor == "handheld")
        then [
          "steam -silent"
        ]
        else [
          "[workspace 1] $terminal"
        ]
      );
  };
}
