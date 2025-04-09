{pkgs, ...}: {
  home.packages = with pkgs; [
    btop
    devenv
    just
    trash-cli

    # universal lsps and formatters
    nil
    alejandra
    lua-language-server
    nodePackages.prettier
  ];

  programs = {
    direnv.enable = true;
    bashmount.enable = true;
    yazi = {
      enable = true;
      settings = {
        opener.edit = [
          {
            run = "nvim $@";
            block = true;
            desc = "Open in NeoVim";
          }
        ];
      };
    };
  };
}
