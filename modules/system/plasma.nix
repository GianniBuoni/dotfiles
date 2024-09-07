{userSettings, ...}: {
  services = {
    desktopManager.plasma6.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        # inherit (userSettings) theme;
      };
      autoLogin = {
        # Enable automatic login for the user.
        enable = true;
        user = userSettings.userName;
      };
    };
  };
}
