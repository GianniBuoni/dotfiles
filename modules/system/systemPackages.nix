{
  pkgs,
  inputs,
  systemSettings,
  ...
}: let
  fromNix = with pkgs; [
    curl
    distrobox
    dig
    docker
    docker-compose
    efibootmgr
    exiftool
    gh
    git
    helix
    lshw
    marksman
    neofetch
    neovim
    pciutils
    tree
    unzip
    wget
  ];

  fromFlakes = with inputs; [
    mathing.defaultPackage.${systemSettings.system}
  ];
in {
  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = fromNix ++ fromFlakes;
    sessionVariables = {EDITOR = "hx";};
  };

  virtualisation.docker.enable = true;
  programs = {
    zsh.enable = true;
  };
}
