{inputs, ...}: {
  imports = [
    inputs.jovian.nixosModules.jovian
    ./services.nix
    ./steam.nix
  ];
}
