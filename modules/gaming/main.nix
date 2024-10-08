{
  pkgs,
  userSettings,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      bottles
      protonup
      mangohud
      moonlight-qt
      discord
      webcord
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${userSettings.userName}/.steam/root/compatibilitytools.d";
    };
  };

  programs = {
    steam.enable = true;
    gamescope.enable = true;
    gamemode.enable = true;
  };
}
