{pkgs, ...}: {
  programs.ags = {
    enable = true;
    configDir = ./widgets;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
