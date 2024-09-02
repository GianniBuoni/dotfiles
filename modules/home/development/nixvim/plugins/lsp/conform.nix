{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;

        # FORMATTERS
        /*
        Refer to "./lsp.nix" and "./none-ls.nix"
        for enabled language servers and formatters.
        */
        formatters_by_ft = {
          astro = ["prettier"];
          html = ["prettier"];
          css = ["prettier"];
          javascript = ["prettier"];
          javascriptreact = ["prettier"];
          typescript = ["prettier"];
          typescriptreact = ["prettier"];
          nix = ["alejandra"];
          markdown = ["prettier"];
        };
      };
    };
  };
}
