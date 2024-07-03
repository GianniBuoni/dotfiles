{pkgs, ...}: {
  programs.nixvim.plugins = {
    autoclose.enable = true;

    # ----- COMPLETIONS ----- #
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-spell.enable = true;
    cmp_luasnip.enable = true;
    cmp-buffer.enable = true;

    cmp = {
      enable = true;

      settings = {
        autoEnableSources = true;
        snippet = {expand = "luasnip";};
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "spell";}
          {name = "luasnip";}
          {name = "buffer";}
        ];

        window = {
          completion = {border = "solid";};
          documentation = {border = "solid";};
        };

        mapping = {
          "<C-Space>" = "cmp.mapping.select_next_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)"; # Scroll [B]ack
          "<C-f>" = "cmp.mapping.scroll_docs(4)"; # Scroll [F]orward
          "<C-e>" = "cmp.mapping.abort()"; # [E]xit
        };
      };
    };

    # ----- SNIPPET ----- #
    luasnip = {
      enable = true;
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
  };
}
