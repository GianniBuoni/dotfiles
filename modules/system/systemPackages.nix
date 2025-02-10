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

    # for neovim lsp and treesitter
    nil
    vimPlugins.nvim-treesitter-parsers.nix
  ];

  environment.variables = {
    EDITOR = "neovim";
  };

  virtualisation.docker.enable = true;
  programs.zsh.enable = true;
}
