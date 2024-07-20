{
  services.mako.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = ["tray" "battery" "temperature" "network" "bluetooth" "power-profiles-daemon" "backlight" "pulseaudio" "custom/wlogout"];
        "hyprland/window"."max-length" = 50;
        "clock" = {
          "format-alt" = "{:%Y-%m-%d, %H:%M}";
        };
        "network" = {
          "format-wifi" = "{icon}";
          "tooltip" = true;
          "tooltip-format" = "{essid} ({signalStrength}%)";
          "format-ethernet" = "󰛳";
          "format-disconnected" = "󰌙";
          "max-length" = 50;
          "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          "on-click" = "nm-connection-editor";
        };
        "bluetooth" = {
          "format" = "󰂯";
          "format-off" = "󰂲";
          "on-click" = "blueman-manager";
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
  };
}
