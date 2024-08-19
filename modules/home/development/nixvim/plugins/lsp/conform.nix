{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;

      # ----- FORMATTERS ----- #
      /*
      Refer to "./lsp.nix" and "./none-ls.nix"
      for enabled language servers and formatters.
      */

      formattersByFt = {
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
}
