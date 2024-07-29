{pkgs, ...}: let
  nn = pkgs.writeShellScriptBin "nn" ''
    git add . -Nf && sudo nixos-rebuild switch --flake . && git reset
  '';
  nh = pkgs.writeShellScriptBin "nh" ''
    git add . -Nf && home-manager switch --flake . && git reset
  '';
  nb = pkgs.writeShellScriptBin "nb" ''
    git add . -Nf && sudo nixos-rebuild boot --flake . && git reset
  '';
  nr = pkgs.writeShellScriptBin "nr" ''
    git add . -Nf && nixos-rebuild switch --flake . --target-host $1 --use-remote-sudo
  '';
in {
  home.packages = [
    nn
    nh
    nb
    nr
  ];
}
