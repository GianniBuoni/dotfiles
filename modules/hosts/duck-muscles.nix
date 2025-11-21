{
  lib,
  config,
  ...
}: let
  lib' = config.flake.lib;
  hostName = "duck-muscles";
  font = "JetBrainsMono";

  nixosHosts.${hostName} = {
    hostData = {
      inherit hostName;
      stateVersion = "24.05";
      users = ["jonnn"];
    };
    themeSettings.palette = "rose-pine";
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

  inherit (nixosHosts.${hostName}) hostData;
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
        ++ lib.map lib'.mkUser hostData.users;

      nixos = {};
    };
  };
}
