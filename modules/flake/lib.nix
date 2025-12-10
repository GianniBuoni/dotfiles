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
    # Disko functions
    mkEsp = size: {
      inherit size;
      type = "EF00";
      content = {
        type = "filesystem";
        format = "vfat";
        mountpoint = "/boot";
        mountOptions = ["umask=0077"];
      };
    };
    mkFs = format: size: mountpoint: {
      inherit size;
      content = {
        inherit mountpoint format;
        type = "filesystem";
      };
    };
    mkLuks = size: {
      inherit size;
      content = {
        type = "luks";
        name = "crypted";
        passwordFile = "/tmp/secret.key";
        settings.allowDiscards = true;
        content = {
          type = "lvm_pv";
          vg = "vg";
        };
      };
    };
  };
}
