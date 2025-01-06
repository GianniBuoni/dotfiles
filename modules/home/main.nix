{userSettings, ...}: {
  home = {
    username = userSettings.userName;
    homeDirectory = "/home/${userSettings.userName}";

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true; # Allow Home Manager to install fonts
}
