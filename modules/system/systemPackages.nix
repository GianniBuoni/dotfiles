{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    distrobox
    docker
    docker-compose
    efibootmgr
    exiftool
    gh
    git
    lshw
    neofetch
    neovim
    pciutils
    tree
    wget
    dig
  ];

  virtualisation.docker.enable = true;
  programs.zsh.enable = true;
}
