{
  wayland.windowManager.hyprland.settings = {
    xwayland.force_zero_scaling = true;
    monitor = [
      "DP-9,prefered,auto,2.0,mirror,DP-5"
      "DP-5,3840x2160@120.00,auto-right,2.0,"
      ",preferred,auto-left,2.0"
    ];

    bindl = [
      ",switch:off:Lid Switch,exec,clamshell-mode open"
      ",switch:on:Lid Switch,exec,clamshell-mode close"
    ];
  };
}
