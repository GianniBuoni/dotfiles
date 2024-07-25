{
  userSettings,
  lib,
  ...
}: {
  services.xserver.displayManager.gdm.enable = lib.mkForce false;
  jovian = {
    hardware.has.amd.gpu = true;
    steam = {
      enable = true;
      autoStart = true;
      user = userSettings.userName;
      desktopSession = "gnome";
    };
  };
}
