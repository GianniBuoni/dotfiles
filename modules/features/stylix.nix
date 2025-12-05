{
  flake-file.inputs.stylix.url = "github:nix-community/stylix";
  flake.aspects.stylix.nixos = {
    lib,
    inputs,
    pkgs,
    config,
    ...
  }: let
    inherit (config) themeSettings;
  in {
    imports = [inputs.stylix.nixosModules.stylix];

    stylix = {
      enable = true;
      autoEnable = true;
      enableReleaseChecks = false;

      # colors
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${themeSettings.palette}.yaml";
      polarity = "dark";
      image = ../../modules/themes/${themeSettings.palette}/wallpaper.jpg;

      # decorations
      opacity.terminal = .95;

      # cursor
      cursor = let
        inherit (themeSettings.cursor) name package;
      in {
        inherit name;
        package = pkgs.${package};
        size = 16;
      };

      # fonts
      fonts = let
        inherit (themeSettings.font) nerd package;
      in {
        monospace = {
          name = nerd;
          package = pkgs.nerd-fonts.${package};
        };
        sizes = {
          applications = 10;
          terminal = 10;
        };
      };
    };
  };

  flake.aspects.stylix.homeManager = {
    lib,
    nixosConfig,
    ...
  }: let
    profileNames = lib.lists.take 1 nixosConfig.hostData.users;
  in {
    stylix.enableReleaseChecks = false;

    stylix.targets = {
      firefox = {inherit profileNames;};
      waybar.enable = false;
      zen-browser = {inherit profileNames;};
    };
  };
}
