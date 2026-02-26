# Check the wiki for a full description of the configuration:
# https://yalter.github.io/niri/
{
  flake.aspects.niri = {
    description = "Scrolling window manager for Wayland.";
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        # optional xwayland integration
        xwayland-satellite
      ];
      programs.niri.enable = true;
    };
  };
}
