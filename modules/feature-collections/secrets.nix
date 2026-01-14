{lib, ...}: {
  flake.aspects = {aspects, ...}: let
    clusters = ["testing" "staging"];

    mkTlsCrt = name: aspects.sops._.keyPaths "cluster-secrets/${name}/tls.crt";
    mkTlsKey = name: aspects.sops._.keyPaths "cluster-secrets/${name}/tls.key";
  in {
    secrets = {
      description = "Collection of secrets for dev machine to access.";
      includes =
        lib.map mkTlsCrt clusters
        ++ lib.map mkTlsKey clusters
        ++ [(aspects.sops._.keyPaths "luks.key")];
    };
  };
}
