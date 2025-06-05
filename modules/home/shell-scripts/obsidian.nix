{pkgs, ...}: let
  sn = "vaults";
  oop = pkgs.writeShellScriptBin "oop" ''
    cd ~/${sn}/personal && hx $1
  '';
  ood = pkgs.writeShellScriptBin "ood" ''
    cd ~/${sn}/development && hx $1
  '';
in {
  home.packages = [
    oop
    ood
  ];
}
