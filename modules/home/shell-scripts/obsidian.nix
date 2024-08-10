{pkgs, ...}: let
  sn = "vaults";
  oo = pkgs.writeShellScriptBin "oo" ''
    cd ~/${sn} && nvim
  '';
  oop = pkgs.writeShellScriptBin "oop" ''
    cd ~/${sn}/personal && nvim $1
  '';
  ood = pkgs.writeShellScriptBin "ood" ''
    cd ~//${sn}/development && nvim $1
  '';
in {
  home.packages = [
    oo
    oop
    ood
  ];
}
