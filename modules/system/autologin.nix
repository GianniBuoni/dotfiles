{userSettings, ...}: {
  services = {
    # Display Manager
    xserver.displayManager.gdm.enable = true;

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = userSettings.userName;
  };
}
