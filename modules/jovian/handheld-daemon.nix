{userSettings, ...}: {
  services = {
    handheld-daemon.enable = true;
    handheld-daemon.user = userSettings.userName;
  };
}
