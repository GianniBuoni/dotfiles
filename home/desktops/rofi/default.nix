{pkgs, ...}: {
  imports = [
    ./style.nix
    ./power-menu.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      display-drun = "Applications ";
      show-icons = true;
    };
  };
}
