{userSettings, ...}: {
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
