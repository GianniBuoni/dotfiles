{pkgs, ...}: {
  home.packages = with pkgs; [
    trash-cli
  ];
  programs = {
    bashmount.enable = true;
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        opener.edit = [
          {
            run = "nvim $@";
            block = true;
            desc = "Open in NeoVim";
          }
        ];
      };
      keymap = {
        manager.prepend_keymap = [
          {
            on = ["f" "f"];
            run = "plugin fzf";
            desc = "Fuzzy find file names";
          }
          {
            on = ["f" "g"];
            run = "search rg";
            desc = "Grep through file contents";
          }
        ];
      };
    };
  };
}
