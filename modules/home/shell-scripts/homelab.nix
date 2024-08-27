{pkgs, ...}: let
  homelab-up = pkgs.writeShellScriptBin "homelab-up" ''
    cd ~/dotfiles && git add . -Nf && sudo nixos-rebuild switch --flake . && git reset &&
    cd ~/docker/sync-stack && dcu &&
    cd ~/docker/media-stack && dcu &&
    cd ~/docker/arr-stack && dcu &&
    cd ~/docker/website-stack/ && dcu
  '';
in {
  home.packages = [
    homelab-up
  ];
}
/*
WIP
 HOMELAB_UP=$(
 )
 while true; do
 read -p "Have you mounted the external drive?" yn
 case $yn in
     [Yy]* ) $HOMELAB_UP ;;
     [Nn]* ) exit ;;
     * ) echo "Please answer yes or no." ;;
 esac
*/

