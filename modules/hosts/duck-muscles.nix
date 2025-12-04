{
  lib,
  config,
  ...
}: let
  hostName = "duck-muscles";
  font = "JetBrainsMono";
  aspects = config.flake.aspects;
  inherit (nixosHosts.${hostName}) hostData;

  nixosHosts.${hostName} = {
    hostData = {
      inherit hostName;
      stateVersion = "24.05";
      users = ["jonnn"];
    };
    themeSettings.palette = "rose-pine-moon";
    themeSettings.font = {
      name = "${font}";
      nerd = "${font} Nerd Font";
      package = "jetbrains-mono";
    };
    themeSettings.cursor = {
      name = "Bibata-Modern-Classic";
      package = "bibata-cursors";
    };
  };

  mkHome = userName: aspects.homeManager._.users "${userName}";
in {
  inherit nixosHosts;

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects;
        [
          (nixosCore._.host "${hostName}")
          hardware._.asusLaptop
          gaming
          greetd
          tablets
          stylix
          virtualization
        ]
        ++ lib.map mkHome hostData.users;

      nixos = {};
    };
  };
}
