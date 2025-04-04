{pkgs, ...}: let
  clamshell-mode = pkgs.writeShellScriptBin "clamshell-mode" ''
    if [[ $1 == "open" ]]
    then
      hyprctl keyword monitor "desc:Samsung Display Corp. ATNA40CU05-0,2880x1800@120.0,4320x0,2.0" && hyprctl reload
    else
      hyprctl keyword monitor "desc:Samsung Display Corp. ATNA40CU05-0,disable"
    fi
  '';
in {
  home.packages = [clamshell-mode];
}
