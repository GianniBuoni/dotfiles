{
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./monitors/${systemSettings.formFactor}.nix
    ./env-variables.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./inputs.nix
    ./keybindings.nix
    ./programs.nix
    ./visuals.nix
    ./workspaces.nix
  ];

  wayland.windowManager.hyprland.enable = true;

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      ipc = "off";
      preload = ["~/dotfiles/themes/${userSettings.theme}/wallpaper.jpg"];
      wallpaper = [",~/dotfiles/themes/${userSettings.theme}/wallpaper.jpg"];
    };
  };
}
