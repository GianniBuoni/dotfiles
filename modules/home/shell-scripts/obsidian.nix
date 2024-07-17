{pkgs, ...}: let
  sn = "vaults";
  oop = pkgs.writeShellScriptBin "oop" ''
    cd ~/Documents/${sn}/personal
    vi
  '';
  ood = pkgs.writeShellScriptBin "ood" ''
    cd ~/Documents/${sn}/personal
    vi
  '';
in {
  home.packages = [
    oop
    ood
  ];
}
