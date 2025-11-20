{
  config,
  lib,
  ...
}: let
  self = config.flake;
in {
  options.nixosHosts = with lib;
    mkOption {
      type = types.attrsOf (types.submodule self.aspects.options.hosts);
    };

  config.flake = {
    nixosConfigurations = lib.mapAttrs self.lib.mkNixosHost config.nixosHosts;
  };
}
