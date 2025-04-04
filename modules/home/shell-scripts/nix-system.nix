{pkgs, ...}: let
  nn = pkgs.writeShellScriptBin "nn" ''
    git add . -Nf && sudo nixos-rebuild switch --flake . && git reset
  '';
  nh = pkgs.writeShellScriptBin "nh" ''
    git add . -Nf && home-manager switch --flake . && git reset
  '';
  nr = pkgs.writeShellScriptBin "nr" ''
    git add . -Nf && nixos-rebuild switch --flake . --target-host $1 --use-remote-sudo && git reset
  '';
  na = pkgs.writeShellScriptBin "na" ''
    git add . -Nf && nix run github:nix-community/nixos-anywhere -- --flake $1 $2 && git reset
  '';
in {
  home.packages = [
    nn
    nh
    nr
    na
  ];
}
