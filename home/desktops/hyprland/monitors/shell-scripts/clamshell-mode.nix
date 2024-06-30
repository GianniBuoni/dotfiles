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
}
