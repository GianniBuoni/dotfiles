{inputs, ...}: {
  imports = [
    inputs.jovian.nixosModules.jovian
    ./handheld-daemon.nix
    ./steam.nix
    ./gnome.nix
    ./gnome-extensions.nix
  ];
}
