{userSettings, ...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
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
          font_family = userSettings.nerdFont;
          font_size = 64;
          color = "rgb(${userSettings.palette.base0E})";

          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          placeholder_text = "";
          fail_text = "";
          dots_center = true;
          fade_on_empty = true;
          inner_color = "rgb(${userSettings.palette.base07})";
          outer_color = "rgb(${userSettings.palette.base0E})";
          font_color = "rgb(${userSettings.palette.base0E})";
          check_color = "rgb(${userSettings.palette.base0F})";
          fail_color = "rgb(${userSettings.palette.base08})";

          size = "300, 70";
          position = "0, -70";
        }
      ];
    };
  };
}
