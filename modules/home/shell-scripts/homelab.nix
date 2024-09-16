{
  pkgs,
  userSettings,
  ...
}: let
  homelab-up = pkgs.writeShellScriptBin "homelab-up" ''
    cd ~/dotfiles && git add . -Nf && sudo nixos-rebuild switch --flake . && git reset &&
    cd ~/repos/${userSettings.website} && dcu runtime &&
    cd ~/docker/core-services && dcu &&
    cd ~/docker/iot-stack && dcu &&
    cd ~/docker/sync-stack && dcu &&
    cd ~/docker/media-stack && dcu &&
    cd ~/docker/arr-stack && dcu
  '';
  homelab-down = pkgs.writeShellScriptBin "homelab-down" ''
    cd ~/repos/${userSettings.website} && dcd runtime &&
    cd ~/docker/core-services && dcd &&
    cd ~/docker/iot-stack && dcd &&
    cd ~/docker/sync-stack && dcd &&
    cd ~/docker/media-stack && dcd &&
    cd ~/docker/arr-stack && dcd
  '';
in {
  home.packages = [
    homelab-up
    homelab-down
  ];
}
