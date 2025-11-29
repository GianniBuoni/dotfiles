top @ {...}: {
  flake-file.inputs.home-manager.url = "github:nix-community/home-manager";

  flake.aspects.homeManager._.users = userName: {
    nixos = {
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

        users.${userName} = {
          # import user's homeManager aspects
          imports = [top.config.flake.modules.homeManager.${userName}];

          # base home-manager settings
          home = {
            username = userName;
            homeDirectory = "/home/${userName}";

            stateVersion = "24.05";
          };

          programs.home-manager.enable = true;
          fonts.fontconfig.enable = true;
        };
      };
    };
  };
}
