{
  config,
  lib,
  ...
}: let
  self = config.flake;
in {
  config.flake = {
    # merge host and theme options
    aspects.options.flake.imports = with self.aspects.options; [hosts themes];
    # call nixos configurations
    nixosConfigurations = lib.mapAttrs self.lib.mkNixosHost config.nixosHosts;
  };

  options.nixosHosts = with lib;
    mkOption {
      type = types.attrsOf (types.submodule self.aspects.options.flake);
    };
}
