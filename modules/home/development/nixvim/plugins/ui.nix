{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    indent-blankline = {
      enable = true;
      settings.indent.char = "┊";
    };
    lualine = {
      enable = true;
      settings.options.globalstatus = true;
    };
    transparent = {
      enable = true;
      settings.exclude_groups = [
        "CursorLine"
      ];
    };
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 7;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"
          ];
        }
        {
          type = "padding";
          val = 5;
        }
        {
          type = "group";
          opts = {spacing = 1;};
          val = let
            mkButton = shortcut: cmd: val: hl: {
              type = "button";
              inherit val;
              on_press = {__raw = "function() vim.cmd[[${cmd}]] end";};
              opts = {
                inherit hl shortcut;
                keymap = [
                  "n"
                  shortcut
                  "<CMD>${cmd}<CR>"
                  {}
                ];
                position = "center";
                cursor = 0;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
          in [
            (
              mkButton
              "f"
              "Telescope find_files"
              "󰈔  Find File"
              "Special"
            )
            (
              mkButton
              "g"
              "Telescope live_grep"
              "󱎸  Find Word"
              "Special"
            )
            (
              mkButton
              "h"
              "Telescope oldfiles"
              "󰑐  Recent Files"
              "Special"
            )
            (
              mkButton
              "o"
              "Neotree toggle left"
              "󰝰  File Tree"
              "Special"
            )
            (
              mkButton
              "e"
              "enew"
              "󰏌  New File"
              "String"
            )
            (
              mkButton
              "q"
              "qa"
              "󰚑  Quit Neovim"
              "String"
            )
          ];
        }
        {
          type = "padding";
          val = 5;
        }
        {
          opts = {
            position = "center";
            hl = "Type";
          };
          type = "text";
          val = [
            "BOOP THE SNOOT! 🐶👃"
          ];
        }
      ];
    };
  };
}
