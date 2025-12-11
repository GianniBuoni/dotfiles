{
  lib,
  config,
  ...
}: let
  baseName = "sleepy-gary";
  hostIds = ["00"];
  hostNames = lib.map (hostId: "${baseName}-${hostId}") hostIds;

  inherit (config.flake) aspects;

  mkHost = hostName: {
    includes = with aspects; [
      (nixosCore._.host "${hostName}")
      k3s
      k3s._.multiNode
      k3s._.serverNode
      virtualization
      jonnn
      k3s-user
    ];
    nixos = {};
  };

  mkHostData = hostName: {
    hostData = {
      inherit hostName;
      users = ["jonnn" "k3s-user"];
    };
  };
in {
  nixosHosts = lib.genAttrs hostNames mkHostData;
  flake.aspects =
    lib.genAttrs hostNames mkHost
    // {
      luks._.sleepy-gary = {
        description = "Feature collection of luks secrets for dev machine to manage.";
        includes =
          lib.map (hostName: aspects.sops._.keyPaths "luksKeys/${hostName}")
          hostNames;
      };
    };
}
