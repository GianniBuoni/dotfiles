{
  lib,
  config,
  ...
}: let
  inherit (config.flake.lib) clusterHosts;
  inherit (config.flake) aspects;

  mkHost = hostName: values: {
    includes = with aspects; [
      (nixosCore._.host "${hostName}")
      hardware._.${values.hardware}
      io._.cluster
      k3s
      k3s._.multiNode
      k3s._.serverNode
      virtualization
      jonnn
      k3s-user
    ];
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
