{
  imports = [
    ./shell-scripts/clamshell-mode.nix
  ];
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "desc:Samsung Display Corp. ATNA40CU05-0,2880x1800@120.0,4320x0,2.0"
      "desc:HAT Kamvas Pro 19 0xF0000005,3840x2160@60.0,0x0,2.0"
      "desc:LG Electronics LG HDR 4K 0x00039027,3840x2160@60.0,1920x0,1.6"
      ",preferred,auto-right,2.0"
    ];

    bindl = [
      ",switch:off:Lid Switch,exec,clamshell-mode open"
      ",switch:on:Lid Switch,exec,clamshell-mode close"
    ];

    xwayland.force_zero_scaling = true;
  };
}
