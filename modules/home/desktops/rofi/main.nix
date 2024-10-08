{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      display-drun = "Applications ";
      display-run = "Run ";
      display-emoji = "Emoji ";
      show-icons = true;
    };
    plugins = with pkgs; [rofi-emoji-wayland];
  };
}
