{
  lib,
  userSettings,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = "5,20,20,20";
      border_size = 1;
      resize_on_border = true;
      allow_tearing = false;
      layout = "dwindle";
      "col.active_border" = lib.mkForce "rgb(${userSettings.palette.base0D}) rgb(${userSettings.palette.base0C}) 45deg";
    };

    decoration = {
      rounding = 7;
      active_opacity = 1.0;
      inactive_opacity = 0.95;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;

      blur.enabled = false;
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 10, default"
        "fade, 1, 7, default,"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true; # You probably want this
    };

    master = {
      new_is_master = true;
    };

    misc = {
      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background.
    };
  };
}
