{
  flake.aspects.waybar.homeManager = {config, ...}: let
    palette = config.lib.stylix.colors;
  in {
    programs.waybar.style = ''
      * {
        margin: 0;
        padding: 0;
        font-family: monospace;
      }

      window#waybar {
        background-color: transparent;
      }

      .modules-center {
        background-color: #${palette.base00};
        border-radius: 2rem;
        margin: 5px 1rem 0px 1rem;
        padding: 0 0.75rem;
      }

      .modules-right {
        background-color: transparent;
        margin: 5px 1rem 0px 1rem;
      }

      button {
        border-radius: 0;
        border: 0;
      }

      #tray, #battery, #temperature, #backlight, #pulseaudio {
        padding: 0 1rem;
        background-color: #${palette.base00};
        border-radius: 2rem;
        margin: 0 0.25rem;
      }

      #power-profiles-daemon {
        padding: 0 0.5rem 0 0.3rem;
        background-color: #${palette.base00};
        border-radius: 2rem;
        margin: 0 0.25rem;
      }

      #custom-wlogout {
        padding: 0 1rem 0 .75rem;
        background-color: #${palette.base00};
        border-radius: 2rem;
        margin: 0 0.25rem;
      }

      #battery {
        color: #${palette.base0B};
      }

      #custom-wlogout {
        color: #${palette.base0D};
      }

      #backlight {
        color: #${palette.base0A};
      }

      #pulseaudio {
        color: #${palette.base0E};
      }
    '';
  };
}
