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
    users = ["jonnn"];
  };
in {
  inherit nixosHosts;

  flake.aspects.${hostName} = {
    includes = with aspects;
      [
        (nixosCore._.host "${hostName}")
        virtualization
      ]
      ++ lib.map lib'.mkUser hostData.users;

    nixos = {};
  };
}
