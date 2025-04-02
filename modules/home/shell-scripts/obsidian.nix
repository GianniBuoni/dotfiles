{pkgs, ...}: let
  sn = "vaults";
  oop = pkgs.writeShellScriptBin "oop" ''
    cd ~/${sn}/personal && nvim $1
  '';
  ood = pkgs.writeShellScriptBin "ood" ''
    cd ~/${sn}/development && nvim $1
  '';
in {
  home.packages = [
    oop
    ood
  ];
}
