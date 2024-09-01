{userSettings, ...}: {
  services = {
    displayManager = {
      # Display Manager
      sddm = {
        enable = true;
        wayland.enable = true;
        # inherit (userSettings) theme;
      };

      # Enable automatic login for the user.
      autoLogin.enable = true;
      autoLogin.user = userSettings.userName;
    };
  };
  # environment.systemPackages = [
  #   (
  #     pkgs.catppuccin-sddm.override {
  #       flavor = "mocha";
  #       # font = userSettings.nerdFont;
  #       # background = "../../themes/${userSettings.theme}/wallpaper.jpg";
  #       # loginBackground = true;
  #     }
  #   )
  # ];
}
