{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.forge
    gnomeExtensions.blur-my-shell
    gnomeExtensions.space-bar
    gnome-tweaks
  ];
}
