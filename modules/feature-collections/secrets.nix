{lib, ...}: {
  flake.aspects = {aspects, ...}: let
    clusters = ["dev" "prod"];
    mkTls = name: ext: aspects.sops._.clusters "${name}" "tls.${ext}";
    mkAge = name: aspects.sops._.clusters "${name}" "age.agekey";
  in {
    secrets = {
      description = "Collection of secrets for dev machine to access.";
      includes =
        lib.forEach clusters (cluster: mkTls cluster "crt")
        ++ lib.forEach clusters (cluster: mkTls cluster "key")
        ++ lib.forEach clusters mkAge
        ++ [(aspects.sops._.keyPaths "luks.key")];
    };
  };
}
