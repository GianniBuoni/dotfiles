{
  flake.aspects.hyprland = {
    nixos.environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = 1; # If the cursor becomes invisible
      NIXOS_OZONE_WL = 1; # Hint electron apps to use Wayland
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };

    homeMangager.wayland.windowManager.hyprland.settings = {
      env = [
        "XCURSOR_SIZE,16"
        "HYPRCURSOR_SIZE,16"
        "HYPRSHOT_DIR,$HOME/Documents/screenshots"
      ];
    };
  };
}
