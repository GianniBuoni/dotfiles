# NOTE: This module only enables system-wide services for Hyprland.
# Please, take a look at the home-manager modules
{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = 1; # If the cursor becomes invisible
      NIXOS_OZONE_WL = 1; # Hint electron apps to use Wayland
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };

    systemPackages = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
}
