{
  flake.aspects.hyprland = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        xdg-desktop-portal-hyprland
      ];

      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
    };

    homeManger = {
      wayland.windowManager.hyprland.enable = true;
    };
  };
}
