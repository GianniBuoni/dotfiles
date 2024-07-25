{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnomeExtensions.caffeine
    gnomeExtensions.topicons-plus
  ];
}
