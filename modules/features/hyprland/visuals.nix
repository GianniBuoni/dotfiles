{
  flake.aspects.hyprland.homeManager = {
    lib,
    config,
    ...
  }: let
    palette = config.lib.stylix.colors;
  in {
    services.hyprpaper = {
      enable = true;
      settings.splash = false;
    };

    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 5;
        gaps_out = "5,20,20,20";
        border_size = 1;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
        "col.active_border" = lib.mkForce "rgb(${palette.base0D}) rgb(${palette.base0C}) 45deg";
      };

      decoration = {
        rounding = 7;
        active_opacity = 1.0;
        inactive_opacity = 0.95;
        shadow.enabled = true;
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

      master.new_status = "master";

      misc = {
        # Set to 0 or 1 to disable the anime mascot wallpapers
        force_default_wallpaper = 0;
        # If true disables the random hyprland logo / anime girl background.
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };
  };
}
