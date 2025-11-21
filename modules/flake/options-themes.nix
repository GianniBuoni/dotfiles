{lib, ...}: {
  flake.aspects.options.themes = with lib; {
    options.themeSettings = let
      fontAttrs = {
        name = mkOption {
          description = "Base name of font";
          type = types.str;
        };
        nerd = mkOption {
          description = "Nerd name of font";
          type = types.str;
        };
        package = mkOption {
          description = "nixpkgs name of font";
          type = types.str;
        };
      };
      cursorAttrs = {
        name = mkOption {
          description = "Name of cursor style";
          type = types.str;
        };
        package = mkOption {
          description = "nixpkgs name of cursor style";
          type = types.str;
        };
      };
    in {
      palette = mkOption {
        description = "name of base16 theme colors; corresponds to a provided flake aspect of themes._.themeName";
        type = types.str;
      };
      font = mkOption {
        description = "Attribute set of font options";
        type = types.attrsOf fontAttrs;
      };
      cursor = mkOption {
        description = "Attribute set cursor style options";
        type = types.attrsOf cursorAttrs;
      };
    };
  };
}
