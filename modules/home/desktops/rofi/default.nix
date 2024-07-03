{pkgs, ...}: {
  imports = [
    ./style.nix
    ./power-menu.nix
    ./screenshot.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      display-drun = "Applications ";
      display-run = "Run ";
      show-icons = true;
    };
  };
}
