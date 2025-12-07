{
  flake.aspects.zerotier.nixos = {
    lib,
    config,
    pkgs,
    ...
  }: let
    secretPath = "zerotierNetwork";
    networkIdPath = config.sops.secrets.${secretPath}.path;
  in {
    sops.secrets.${secretPath} = {};

    # IMPURE requires secrets to already be bootstrapped to build
    services.zerotierone = lib.mkIf (builtins.pathExists networkIdPath) {
      enable = true;
      joinNetworks = [(builtins.readFile networkIdPath)];
    };
  };
}
