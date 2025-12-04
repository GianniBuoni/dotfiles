{
  lib,
  config,
  ...
}: let
  hostName = "test-host-gui";
  font = "JetBrainsMono";
  aspects = config.flake.aspects;

  inherit (nixosHosts.${hostName}) hostData;
  inherit (config.flake.lib) mkUser;

  nixosHosts.${hostName} = {
    hostData = {
      inherit hostName;
      users = ["jonnn" "k3s-user"];
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
in {
  inherit nixosHosts;

  flake.aspects.${hostName} = {
    description = ''
      Test host that has graphical interface.
    '';
    includes = with aspects;
      [
        (nixosCore._.host "${hostName}")
        hardware._.latitude
        k3s
        k3s._.singleNode
        stylix
        virtualization
      ]
      ++ lib.map mkUser hostData.users;

    nixos = {};
  };
}
