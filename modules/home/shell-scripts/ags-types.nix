{pkgs, ...}: let
  path = "~/dotfiles";
  ags-types = pkgs.writeShellScriptBin "ags-types" ''
    ags --init -c ${path}/modules/home/desktops/ags/widgets
  '';
in {
  home.packages = [
    ags-types
  ];
}
