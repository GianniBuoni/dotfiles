# These are system files and are imported in the the hyprland.nix files
{pkgs, ...}: {
  # APPLETS FOR WAYBAR
  home.packages = with pkgs; [
    mako # Notification daemon
    libnotify # Mako dependency
    blueman
    pavucontrol
    networkmanagerapplet
  ];
}
