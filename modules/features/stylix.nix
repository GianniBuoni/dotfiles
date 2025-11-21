{
  flake-file.inputs.stylix.url = "github:nix-community/stylix";
  flake.aspects.stylix.nixos = {
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

      # colors
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${themeSettings.palette}.yaml";
      polarity = "dark";
      image = ./modules/themes/${themeSettings.palette}/wallpaper.jpg;

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
        inherit (themeSettings.font) name package;
      in {
        monospace = {
          inherit name;
          package = pkgs.${package};
        };
        sizes = {
          applications = 10;
          terminal = 10;
        };
      };
    };
  };
}
