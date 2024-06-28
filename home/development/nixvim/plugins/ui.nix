{
  programs.nixvim.plugins = {
    indent-blankline = {
      enable = true;
      settings.indent.char = "┊";
    };
    lualine = {
      enable = true;
      globalstatus = true;
    };
    transparent = {
      enable = true;
      settings.exclude_groups = [
        "CursorLine"
      ];
    };
  };
}
