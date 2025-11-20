{userSettings, ...}: {
  stylix.targets = {
    grub.enable = false;
  };
  home-manager.users.${userSettings.userName}.stylix.targets = {
    waybar.enable = false;
  };
}
