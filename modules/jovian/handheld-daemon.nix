{userSettings, ...}: {
  services.handheld-daemon.enable = true;
  services.handheld-daemon.user = userSettings.userName;
}
