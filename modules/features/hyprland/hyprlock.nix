{
  flake.aspects.hyprland.homeManager = {
    lib,
    nixosConfig,
    config,
    ...
  }: let
    palette = config.lib.stylix.colors;
  in {
    programs.hyprlock.enable = true;

    programs.hyprlock.settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = lib.mkForce [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      label = [
        {
          monitor = "";
          text = "󰌾 Password, please!";
          allow_breaks = true;
          text_align = "center";
          font_family = nixosConfig.themeSettings.font.nerd;
          font_size = 64;
          color = "rgb(${palette.base0E})";

          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = with palette;
        lib.mkForce [
          {
            monitor = "";
            placeholder_text = "";
            fail_text = "";
            dots_center = true;
            fade_on_empty = true;
            inner_color = "rgb(${base07})";
            outer_color = "rgb(${base0E})";
            font_color = "rgb(${base0E})";
            check_color = "rgb(${base0F})";
            fail_color = "rgb(${base08})";

            size = "300, 70";
            position = "0, -70";
          }
        ];
    };
  };
}
