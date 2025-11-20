{
  pkgs,
  userSettings,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd hyprland";
        user = userSettings.userName;
      };
    };
  };
}
