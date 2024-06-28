# NOTE: Some sytem-wide dotfiles live in the `/modules`
{userSettings, ...}: {
  imports = [
    ./art
    ./desktops
    ./desktops/waybar # Stylix overrides styles if not loaded this way
    ./development
    ./productivity
    ../modules/stylix
  ];
  home = {
    username = userSettings.userName;
    homeDirectory = "/home/${userSettings.userName}";

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true; # Allow Home Manager to install fonts

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
