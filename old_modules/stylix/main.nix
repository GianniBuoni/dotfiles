{
  pkgs,
  userSettings,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;

    # ----- COLORS ----- #
    base16Scheme = userSettings.palette;
    polarity = "dark";
    image = ../../themes/${userSettings.theme}/wallpaper.jpg;

    # ----- DECORATIONS ----- #
    opacity = {
      terminal = .95;
    };

    # ----- CURSORS ----- #
    cursor = {
      name = userSettings.cursor;
      package = pkgs.${userSettings.cursorPkg};
      size = 16;
    };

    # ----- FONTS -----#
    fonts = {
      monospace = {
        name = userSettings.nerdFont;
        package = pkgs.nerd-fonts.${userSettings.nerdPkg};
      };
    };

    fonts.sizes = {
      applications = 10;
      terminal = 10;
    };
  };
}
