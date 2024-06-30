{
  imports = [
    ./shell-scripts/clamshell-mode.nix
  ];
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-2,2880x1800@120.0,4320x0,2.0"
      "DP-1,3840x2160@60.0,0x0,2.0"
      "DP-3,3840x2160@60.0,1920x0,1.6"
    ];

    bindl = [
      ",switch:off:Lid Switch,exec,clamshell-mode open"
      ",switch:on:Lid Switch,exec,clamshell-mode close"
    ];

    xwayland.force_zero_scaling = true;
  };
}
