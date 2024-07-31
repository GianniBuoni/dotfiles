{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    distrobox
    docker
    docker-compose
    efibootmgr
    gh
    git
    lshw
    neofetch
    neovim
    tree
    wget
  ];

  virtualisation.docker.enable = true;
  programs.zsh.enable = true;
}
