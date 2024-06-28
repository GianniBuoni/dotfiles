# NOTE: This module only enables system-wide services for Hyprland.
{
  imports = [
    ../waybar/waybar.nix
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1; # If the cursor becomes invisible
    NIXOS_OZONE_WL = 1; # Hint electron apps to use Wayland
  };
}
