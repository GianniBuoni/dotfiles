{
  lib,
  config,
  ...
}: {
  flake.aspects = {aspects, ...}: let
    inherit (config.flake.lib) clusterHosts;
    clusters = ["testing" "staging" "prod"];

    mkAge = name: aspects.sops._.keyPaths "cluster-secrets/${name}/age.agekey";
    mkLuks = hostName: aspects.sops._.keyPaths "luksKeys/${hostName}";
  in {
    secrets = {
      description = "Collection of secrets for dev machine to access.";
      includes = lib.map mkAge clusters ++ lib.map mkLuks (builtins.attrNames clusterHosts);
    };
  };
}
