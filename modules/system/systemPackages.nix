{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
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

    # for neovim lsp and treesitter
    # lua and nix supported system-wide
    # prettier for markdown and yaml formating
  ];

  environment.sessionVariables = {EDITOR = "hx";};

  virtualisation.docker.enable = true;
  programs = {
    zsh.enable = true;
  };
}
