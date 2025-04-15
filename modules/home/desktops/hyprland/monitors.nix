{systemSettings, ...}: {
  wayland.windowManager.hyprland.settings = {
    xwayland.force_zero_scaling = true;
    monitor = [
      "desc:HAT Kamvas Pro 19 0xF0000005,1920x1080@30.0,0x0,1.0"
      "DP-5,3840x2160@120.00,1920x0,2.0,"
      ",preferred,auto-right,2.0"
    ];

    bindl = [
      ",switch:off:Lid Switch,exec,clamshell-mode open"
      ",switch:on:Lid Switch,exec,clamshell-mode close"
    ];
  };
}
