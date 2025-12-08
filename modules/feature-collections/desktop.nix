{
  flake.aspects = {aspects, ...}: {
    desktop = {
      includes = with aspects; [
        hyprland
        rofi
        waybar
        fuzzel
      ];

      homeManager = {pkgs, ...}: {
        home.packages = with pkgs; [
          libnotify # Mako dependency
          blueman
          pavucontrol
          networkmanagerapplet
        ];

        services.mako.enable = true;
      };
    };
  };
}
