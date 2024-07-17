{pkgs, ...}: let
  sn = "vaults";
  oop = pkgs.writeShellScriptBin "oop" ''
    cd ~/Documents/${sn}/personal
    nvim
  '';
  ood = pkgs.writeShellScriptBin "ood" ''
    cd ~/Documents/${sn}/development
    nvim
  '';
in {
  home.packages = [
    oop
    ood
  ];
}
