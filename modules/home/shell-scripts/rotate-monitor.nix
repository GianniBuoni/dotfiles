{pkgs, ...}: let
  rotate-monitor = pkgs.writeShellScriptBin "rotate-monitor" ''
    hyprctl keyword monitor "$1,preferred,auto-$2,2,transform,$3"
  '';
in {
  home.packages = [
    rotate-monitor
  ];
}
