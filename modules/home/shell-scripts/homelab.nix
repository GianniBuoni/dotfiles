{
  pkgs,
  userSettings,
  ...
}: let
  homelab-up = pkgs.writeShellScriptBin "homelab-up" ''
    cd ~/dotfiles && git add . -Nf && sudo nixos-rebuild switch --flake . && git reset &&
    cd ~/docker && docker compose up -d &&
    cd ~/docker/${userSettings.website} && docker compose --profile runtime up -d
    cd ~/docker/arr-stack && docker compose up -d
  '';
  homelab-down = pkgs.writeShellScriptBin "homelab-down" ''
    cd ~/docker && docker compose down &&
    cd ~/docker/${userSettings.website} && docker compose --profile runtime down
    cd ~/docker/arr-stack && docker compose down
  '';
in {
  home.packages = [
    homelab-up
    homelab-down
  ];
}
