{
  lib,
  config,
  ...
}: let
  inherit (config.flake.lib) clusterHosts;
  inherit (config.flake) aspects;

  mkHost = hostName: values: {
    includes = with aspects;
      [
        (nixosCore._.host "${hostName}")
        hardware._.${values.hardware}
        io._.cluster
        boot._.luks
        k3s
        k3s._.multiNode
        virtualization
        jonnn
        k3s-user
      ]
      ++ (
        if hostName == "sleepy-gary-00"
        then [
          k3s._.firstNode
        ]
        else [
          k3s._.serverNode
        ]
      );

    nixos = {};
  };

  mkHostData = hostName: _: {
    hostData = {
      inherit hostName;
      users = ["jonnn" "k3s-user"];
    };
  };
in {
  nixosHosts = lib.mapAttrs mkHostData clusterHosts;
  flake.aspects = lib.mapAttrs mkHost clusterHosts;
}
