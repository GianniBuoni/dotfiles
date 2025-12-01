{
  lib,
  config,
  ...
}: let
  lib' = config.flake.lib;
  hostName = "test-host";

  nixosHosts.${hostName}.hostData = {
    inherit hostName;
    users = ["jonnn"];
    hasHomeManager = false;
  };

  inherit (nixosHosts.${hostName}) hostData;
in {
  inherit nixosHosts;

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects;
        [
          (nixosCore._.host "${hostName}")
          virtualization
        ]
        ++ lib.map lib'.mkUser hostData.users;

      nixos = {};
    };
  };
}
