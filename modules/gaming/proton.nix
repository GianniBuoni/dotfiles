{
  pkgs,
  userSettings,
  ...
}: {
  # ----- PROTON GE  -----#
  environment = {
    systemPackages = with pkgs; [
      protonup
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${userSettings.userName}/.steam/root/compatibilitytools.d";
    };
  };
}
