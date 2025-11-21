{
  pkgs,
  inputs,
  ...
}: let
  fromNix = with pkgs; [
    gh
    git
    helix
    marksman
    neovim
  ];

  fromFlakes = with inputs; [
    mathing.defaultPackage.${pkgs.system}
    sb.packages.${pkgs.system}.default
  ];
in {
  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = fromNix ++ fromFlakes;
    sessionVariables = {EDITOR = "hx";};
  };

  programs = {
    zsh.enable = true;
  };
}
