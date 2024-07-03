# These are system files and are imported in the the hyprland.nix files
{pkgs, ...}: {
  # APPLETS FOR WAYBAR
  environment.systemPackages = with pkgs; [
    mako # Notification daemon
    libnotify # Mako dependency
    blueman
    pavucontrol
    networkmanagerapplet
  ];
}
