{
  userSettings,
  lib,
  ...
}: {
  services.xserver.displayManager.gdm.enable = lib.mkForce false;
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      user = userSettings.userName;
      desktopSession = "gnome";
    };
    # decky-loader.enable = true;
  };
}
