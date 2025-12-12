{
  lib,
  config,
  ...
}: let
  inherit (config.flake.lib) clusterHosts;
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
  nixosHosts = lib.genAttrs clusterHosts mkHostData;
  flake.aspects = lib.genAttrs clusterHosts mkHost;
}
