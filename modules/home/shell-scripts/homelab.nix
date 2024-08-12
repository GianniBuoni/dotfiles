{pkgs, ...}: let
  dcu = "sudo docker compose up -d";
  homelab-up = pkgs.writeShellScriptBin "homelab-up" ''
    # INSERT WARNING ABOUT MOUNTING EXTERNAL DRIVE
    sudo mount $1 ~/external
    cd ~/dotfiles && git add . -Nf && sudo nixos-rebuild switch --flake . && git reset &&
    cd ~/docker/util-stack && ${dcu} &&
    cd ~/docker/media-stack && ${dcu} &&
    cd ~/docker/arr-stack && ${dcu}
  '';
in {
  home.packages = [
    homelab-up
  ];
}
