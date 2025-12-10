{
  lib,
  config,
  ...
}: let
  hostName = "test-host";
  aspects = config.flake.aspects;

  inherit (nixosHosts.${hostName}) hostData;
  inherit (config.flake.lib) mkUser;

  nixosHosts.${hostName}.hostData = {
    inherit hostName;
    users = ["jonnn" "k3s-user"];
  };
in {
  inherit nixosHosts;

  flake.aspects.${hostName} = {
    description = ''
      Test host that has a minimal configuration and initlaizes a single node k3s cluster.
    '';
    includes = with aspects;
      [
        (nixosCore._.host "${hostName}")
        hardware._.intel
        k3s
        k3s._.singleNode
        virtualization
      ]
      ++ lib.map mkUser hostData.users;

    nixos = {};
  };
}
