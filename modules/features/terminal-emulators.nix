let
  padding = 10;
in {
  flake.aspects.terminalEmulators.homeManager = {
    programs.ghostty = {
      enable = true;
      settings = {
        window-padding-x = padding;
        window-padding-y = padding;
      };
    };
    programs.kitty = {
      enable = true;
      settings = {
        window_padding_width = padding;
        confirm_os_window_close = 0;
      };
    };
  };
}
