{
  flake.aspects.hyprland = {
    nixos = {
      pkgs,
      lib,
      config,
      ...
    }:
      lib.mkIf (config ? home-manager) {
        environment.systemPackages = with pkgs; [
          xdg-desktop-portal-hyprland
        ];

        programs.hyprland = {
          enable = true;
          xwayland.enable = true;
        };
      };

    homeManager = {
      wayland.windowManager.hyprland.enable = true;
    };
  };
}
