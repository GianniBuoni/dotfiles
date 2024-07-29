{inputs, ...}: {
  imports = [
    inputs.ags.homeManagerModules.ags
    ./main.nix
  ];
}
