{
  flake.aspects.gaming = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        bottles
        protonup-ng
        mangohud
        moonlight-qt
      ];

      programs = {
        steam.enable = true;
        gamescope.enable = true;
        gamemode.enable = true;
      };
    };

    # import this feature at the user definition
    # TODO consider moving this varaible to a per-user home-manager definition
    _.user = userName: {
      nixos.environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${userName}/.steam/root/compatibilitytools.d";
      };
    };
  };
}
