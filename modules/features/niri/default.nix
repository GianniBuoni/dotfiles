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
