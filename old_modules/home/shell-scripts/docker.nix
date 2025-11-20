{pkgs, ...}: let
  dc = pkgs.writeShellScriptBin "dc" ''
    if [ $1 = "up" ]; then
      case $# in
        2) docker compose --profile $2 up -d ;;
        3) docker compose --profile $2 up $3 -d ;;
        *) docker compose up -d ;;
      esac
    else
      case $# in
        2) docker compose --profile $2 $1 ;;
        3) docker compose --profile $2 $1 $3 ;;
        *) docker compose $1
      esac
    fi
  '';
in {
  home.packages = [
    dc
  ];
}
