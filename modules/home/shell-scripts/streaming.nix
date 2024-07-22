{pkgs, ...}: let
  monitor = "HDMI-A-3";
  stream-1440 = pkgs.writeShellScriptBin "stream-1440" ''
    hyprctl keyword monitor "${monitor},2560x1440@59.95,0x0,2"
  '';
  stream-4k = pkgs.writeShellScriptBin "stream-4k" ''
    hyprctl keyword monitor "${monitor},3840x2160@29.94,0x0,2"
  '';
in {
  home.packages = [
    stream-1440
    stream-4k
  ];
}
