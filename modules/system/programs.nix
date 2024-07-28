{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    distrobox
    docker
    gh
    git
    neovim
    podman
    wget
    efibootmgr
    lshw
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  virtualisation.podman.enable = true;
}
