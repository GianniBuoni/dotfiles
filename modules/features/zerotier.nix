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
    sops.secrets.${secretPath} = let
      user = toString (builtins.elemAt config.hostData.users 0);
    in {
      owner = config.users.users.${user}.name;
      inherit (config.users.users.${user}) group;
    };

    # IMPURE requires secrets to already be bootstrapped to build
    services.zerotierone = lib.mkIf (builtins.pathExists networkIdPath) {
      enable = true;
      joinNetworks = [(builtins.readFile networkIdPath)];
    };
  };
}
