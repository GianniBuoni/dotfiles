{userSettings, ...}: {
  services = {
    displayManager = {
      sddm.enable = true;
      # Enable automatic login for the user.
      # autoLogin.enable = true;
      # autoLogin.user = userSettings.userName;
    };
    desktopManager.plasma6.enable = true;
  };
}
