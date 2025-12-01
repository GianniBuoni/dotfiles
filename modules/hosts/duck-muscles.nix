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

  mkUser = userName: {
    includes = with aspects; [
      aspects.${userName}
      (homeManager._.users "${hostName}" "${userName}")
    ];

    nixos = {};
  };

  mapUser = userName: aspects.${hostName}._.${userName};
in {
  inherit nixosHosts;

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects;
        [
          (nixosCore._.host "${hostName}")
          asusLaptop
          gaming
          greetd
          tablets
          stylix
          virtualization
        ]
        ++ lib.map mapUser hostData.users;

      nixos = {};
      _ = lib.genAttrs hostData.users mkUser;
    };
  };
}
