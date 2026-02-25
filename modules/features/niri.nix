{
  flake.aspects.niri = {
    description = "Scrolling window manager for Wayland.";
    nixos = {
      programs.niri.enable = true;
    };
  };
}
