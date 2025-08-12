{pkgs, ...}: let
  rotate-monitor = pkgs.writeShellScriptBin "rotate-monitor" ''
    hyprctl keyword monitor "$1,preferred,auto-$2,2,transform,$3"
  '';
  art-mode = pkgs.writeShellScriptBin "art-mode" ''
    hyprctl keyword monitor "DP-9,prefered,auto,2.0,mirror,eDP-1"
  '';
in {
  home.packages = [
    rotate-monitor
    art-mode
  ];
}
