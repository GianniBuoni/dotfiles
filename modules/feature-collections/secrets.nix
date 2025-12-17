{
  lib,
  config,
  ...
}: {
  flake.aspects = {aspects, ...}: let
    clusters = ["testing" "staging" "prod"];

    mkAge = name: aspects.sops._.keyPaths "cluster-secrets/${name}/age.agekey";
  in {
    secrets = {
      description = "Collection of secrets for dev machine to access.";
      includes =
        lib.map mkAge clusters
        ++ [(aspects.sops._.keyPaths "luks.key")];
    };
  };
}
