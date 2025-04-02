{pkgs, ...}: {
  home.packages = with pkgs; [
    trash-cli
  ];
  programs = {
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
