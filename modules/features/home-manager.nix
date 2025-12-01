top @ {...}: {
  flake-file.inputs.home-manager.url = "github:nix-community/home-manager";

  flake.aspects = {aspects, ...}: {
    homeManager._.users = hostName: username: {
      nixos = {
        lib,
        inputs,
        config,
        ...
      }: {
        imports = [inputs.home-manager.nixosModules.home-manager];

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          backupFileExtension = "hmbak";

          users.${username} = {
            # import user's homeManager aspects
            imports = [
              top.config.flake.modules.homeManager.${username}
            ];

            # base home-manager settings
            home = {
              homeDirectory = "/home/${username}";

              inherit username;
              inherit (config.hostData) stateVersion;
            };

            programs.home-manager.enable = true;
            fonts.fontconfig.enable = true;
          };
        };
      };
    };
  };
}
