{inputs, ...}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    ./main.nix
    ./targets.nix
  ];
}
