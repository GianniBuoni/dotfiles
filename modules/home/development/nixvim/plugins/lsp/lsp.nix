{
  programs.nixvim.plugins = {
    # ----- TREESITTER: Language Parsers -----#
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        ensureInstalled = [
          "astro"
          "go"
          "html"
          "javascript"
          "markdown"
          "nix"
          "typescript"
          "tsx"
        ];
      };
    };

    # ----- LSP: Language Server Protocol ----- #
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        astro.enable = true;
        gopls.enable = true; # Official Go LSP
        html.enable = true; # HTML
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        pylsp.enable = true;
        pyright.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true; # Typescript and TSX
      };
      keymaps = {
        silent = true;
        lspBuf = {
          "<leader>gd" = {
            action = "definition";
            desc = "[G]o to [D]efinition"; #codespell:ignore efinition
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "[C]ode [A]ction";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Show [E]rror Message";
          };
          "<leader>q" = {
            action = "setloclist";
            desc = "Show [Q]uick Fix List";
          };
          "<leader>d" = {
            action = "goto_next";
            desc = "Show [D]iagnostic";
          };
        };
      };
    };
  };
}
