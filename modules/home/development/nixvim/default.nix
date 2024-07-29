{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keybindings.nix
    ./plugins
  ];

  programs.nixvim.enable = true;
}
