{pkgs, ...}: let
  dcu = pkgs.writeShellScriptBin "dcu" ''
    sudo docker compose up -d
  '';
  dcd = pkgs.writeShellScriptBin "dcd" ''
    sudo docker compose down
  '';
in {
  home.packages = [
    dcu
    dcd
  ];
}
