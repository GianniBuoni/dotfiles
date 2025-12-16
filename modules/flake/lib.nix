{
  inputs,
  config,
  ...
}: let
  self = config.flake.modules;
in {
  flake.lib = {
    # constants
    clusterHosts = let
      clusterName = "sleepy-gary";
      clusterData = [
        {
          name = "${clusterName}-00";
          value = {hardware = "amd";};
        }
      ];
    in
      builtins.listToAttrs clusterData;

    # functions
    mkUser = userName: config.flake.aspects.${userName};
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

    # disko functions
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
    mkSwap = size: {
      inherit size;
      content = {
        type = "swap";
        discardPolicy = "both";
      };
    };
  };
}
