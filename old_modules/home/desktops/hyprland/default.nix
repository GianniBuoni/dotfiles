# NOTE: Hyprland needs to also enabled via NIX OS System
# Please, remember to activate it on the system modules
{
  imports = [
    ./main.nix
    ./env-variables.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./inputs.nix
    ./keybindings.nix
    ./monitors.nix
    ./programs.nix
    ./visuals.nix
    ./workspaces.nix
  ];
}
