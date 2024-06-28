{pkgs, ...}: let
  clamshell-mode = pkgs.writeShellScriptBin "clamshell-mode" ''
    external_monitor=$(hyprctl monitors | grep "\sDP-[0-9]")

    if [[ $external_monitor ]]
    then
      if [[ $1 == "open" ]]
      then
        hyprctl keyword monitor "eDP-2,2880x1800@120.0,4320x0,2.0" && hyprctl reload
      else
        hyprctl keyword monitor "eDP-2,disable"
      fi
    fi
  '';
in {
  home.packages = [clamshell-mode];
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
