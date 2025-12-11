let
  secretPath = "zerotierNetwork";
in {
  flake.aspects = {aspects, ...}: {
    zerotier = {
      includes = [(aspects.sops._.keyPaths "${secretPath}")];

      nixos = {
        lib,
        config,
        pkgs,
        ...
      }: let
        networkIdPath = config.sops.secrets.${secretPath}.path;
      in {
        # IMPURE requires secrets to already be bootstrapped to build
        services.zerotierone = lib.mkIf (builtins.pathExists networkIdPath) {
          enable = true;
          joinNetworks = [(builtins.readFile networkIdPath)];
        };
      };
    };
  };
}
