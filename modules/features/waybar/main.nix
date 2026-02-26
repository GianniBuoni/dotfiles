{
  flake.aspects.waybar.homeManager.programs.waybar = {
    enable = true;
    systemd.enable = false;

    settings.mainBar = {
      layer = "top";
      position = "top";
      modules-center = ["clock"];
      modules-right = ["tray" "battery" "temperature" "power-profiles-daemon" "backlight" "pulseaudio" "custom/wlogout"];
      "hyprland/window"."max-length" = 50;
      "clock" = {
        "format-alt" = "{:%Y-%m-%d, %H:%M}";
      };
      "battery" = {
        "format" = "{capacity}% {icon}";
        "format-icons" = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
      };
      "power-profiles-daemon" = {
        "format" = " {icon} ";
        "tooltip-format" = "{profile}";
        "tooltip" = true;
        "format-icons" = {
          "default" = "";
          "performance" = "";
          "balanced" = "󰗑";
          "power-saver" = "󰌪";
        };
      };
      "backlight" = {
        "format" = "{percent}% {icon}";
        "format-icons" = ["󰃚" "󰃛" "󰃜" "󰃝" "󰃞"];
      };
      "pulseaudio" = {
        "format" = "{volume}% {icon}";
        "format-icons" = [""];
        "on-click" = "pavucontrol";
      };
      "custom/wlogout" = {
        "format" = "{icon}";
        "format-icons" = "󱄅";
        "on-click" = "power-menu";
        "tooltip" = true;
        "tooltip-format" = "Power Menu";
      };
    };
  };
}
