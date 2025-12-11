{
  flake.aspects.clipboard = {
    description = "Wayland clipboard management tools";
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [wl-clipboard-rs wtype];
    };
  };
}
