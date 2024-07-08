{
  programs.waybar.style = ''
    * {
      margin: 0;
      padding: 0;
      font-family: monospace;
    }

    window#waybar {
      background-color: transparent;
    }

    .modules-left, .modules-center {
      background-color: @base00;
      border-radius: 2rem;
      margin: 5px 1rem;
      padding: 0 0.75rem;
    }

    .modules-right {
      background-color: transparent;
      margin: 5px 1rem;
    }

    .modules-left #workspaces button {
      border-radius: 0;
      border: 0;
    }

    .modules-left #workspaces button.focused,
    .modules-left #workspaces button.active {
      border: 0;
      color: @base09;
    }

    #tray, #battery, #temperature, #bluetooth, #backlight, #pulseaudio {
      padding: 0 1rem;
      background-color: @base00;
      border-radius: 2rem;
      margin: 0 0.25rem;
    }

    #network {
      padding: 0 1.1rem 0 0.75rem;
      background-color: @base00;
      border-radius: 2rem;
      margin: 0 0.25rem;
    }

    #power-profiles-daemon {
      padding: 0 0.5rem 0 0.3rem;
      background-color: @base00;
      border-radius: 2rem;
      margin: 0 0.25rem;
    }

    #custom-wlogout {
      padding: 0 1rem 0 .75rem;
      background-color: @base00;
      border-radius: 2rem;
      margin: 0 0.25rem;
    }

    #battery {
      color: @base0B;
    }

    #network, #bluetooth, #custom-wlogout {
      color: @base0D;
    }

    #backlight {
      color: @base0A;
    }

    #pulseaudio {
      color: @base0E;
    }
  '';
}