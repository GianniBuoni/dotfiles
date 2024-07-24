let
  gamingSpace = "3";
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.
    windowrule = [
      "workspace ${gamingSpace} silent,steam"
      "workspace ${gamingSpace}, moonlight"
    ];
  };
}
