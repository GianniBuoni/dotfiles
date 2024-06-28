{
  programs.nixvim.plugins = {
    # ------ NONE LS: Diagnostic and Formatting Injections ----- #
    none-ls = {
      enable = true;
      sources = {
        code_actions = {statix.enable = true;}; # Statix provides more pattern suggestions for nix
        diagnostics = {
          codespell.enable = true; # Codespell provides spellcheck
          statix.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
      options = {
        silent = true;
        desc = "[C]ode [F]ormat";
      };
    }
  ];
}
