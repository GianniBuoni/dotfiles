{
  inputs,
  config,
  ...
}: let
  self = config.flake.modules;
in {
  flake.lib = {
    mkNixosHost = hostName: opts:
      inputs.nixpkgs.lib.nixosSystem {
        pkgs = import inputs.nixpkgs {
          inherit (opts.hostData) system;
          config.allowUnfree = true;
        };
        specialArgs = {inherit inputs;};
        modules = [
          # import options and host modules
          self.flake.options
          self.nixos.${hostName}
          # inherit flake's config settings
          {config = opts;}
          # set state version
          {system = {inherit (opts.hostData) stateVersion;};}
        ];
      };
    mkUser = userName: config.flake.aspects.${userName};
    mkFs = format: size: mountpoint: {
      inherit size;
      content = {
        inherit mountpoint format;
        type = "filesystem";
      };
    };
  };
}
