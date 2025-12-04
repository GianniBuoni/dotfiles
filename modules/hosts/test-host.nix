{
  lib,
  config,
  ...
}: let
  hostName = "test-host";
  aspects = config.flake.aspects;
  inherit (nixosHosts.${hostName}) hostData;

  lib' = config.flake.lib;

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
        virtualization
        k3s
        k3s._.singleNode
      ]
      ++ lib.map lib'.mkUser hostData.users;

    nixos = {};
  };
}
