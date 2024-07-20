{pkgs, ...}: {
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
