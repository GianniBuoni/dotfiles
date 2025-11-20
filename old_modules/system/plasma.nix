{userSettings, ...}: {
  services = {
    desktopManager.plasma6.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      autoLogin = {
        # Enable automatic login for the user.
        enable = true;
        user = userSettings.userName;
      };
      defaultSession = "hyprland";
    };
  };
}
