{userSettings, ...}: {
  jovian = {
    hardware.has.amd.gpu = true;
    steam = {
      enable = true;
      autoStart = true;
      user = userSettings.userName;
      desktopSession = "gnome";
    };
    # Make sure to enable CEF Debugging in the Steam Developer Settings!
    decky-loader.enable = true;
  };
}
