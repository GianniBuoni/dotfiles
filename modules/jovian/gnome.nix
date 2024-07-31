{lib, ...}: {
  services.xserver = {
    displayManager.gdm.enable = lib.mkForce false;
    desktopManager.gnome.enable = true;
  };
}
