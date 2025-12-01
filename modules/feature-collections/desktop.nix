{
  flake.aspects = {aspects, ...}: {
    desktop = {
      includes = with aspects; [
        hyprland
      ];
    };
  };
}
