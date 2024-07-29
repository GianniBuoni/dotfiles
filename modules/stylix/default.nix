{inputs, ...}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    ./main.nix
    ./system.nix
  ];
}
