{pkgs, ...}: {
  programs.ags = {
    enable = true;
    configDir = ./widgets;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk_4_1
      accountsservice
    ];
  };
}
