{
  userSettings,
  lib,
  ...
}: {
  services = {
    handheld-daemon = {
      enable = true;
      user = userSettings.userName;
    };
    displayManager.sddm.enable = lib.mkForce false;
  };
}
