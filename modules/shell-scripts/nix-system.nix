{pkgs, ...}: let
  nn = pkgs.writeShellScriptBin "nn" ''
    git add . -Nf && sudo nixos-rebuild switch --flake . && git reset
  '';
  nh = pkgs.writeShellScriptBin "nh" ''
    git add . -Nf && home-manager switch --flake . && git reset
  '';
in {
  environment.systemPackages = [
    nn
    nh
  ];
}
