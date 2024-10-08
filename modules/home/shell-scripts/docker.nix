{pkgs, ...}: let
  dcu = pkgs.writeShellScriptBin "dcu" ''
    if [ $# -eq 0 ]; then
      docker compose up -d
    else
      docker compose --profile $1 up -d
    fi
  '';
  dcd = pkgs.writeShellScriptBin "dcd" ''
    if [ $# -eq 0 ]; then
      docker compose down
    else
      docker compose --profile $1 down
    fi
  '';
in {
  home.packages = [
    dcu
    dcd
  ];
}
