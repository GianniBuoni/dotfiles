/*
Looking for Diagnostic Keymapptings?
I've moved them to their respective plugin files:

- General diagnostic mappings are in the LSP section of "lsp.nix"
- Formatting and refactoring actions sare in the NONE LS section of "lsp.nix"
*/
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    # ----- HIGHLIGHTING ----- #
    opts.hlsearch = true;

    # ----- KEYMAPPING PROPER ----- #
    keymaps = [
      # ----- HIGHLIGHTING pt. 2 ----- #
      {
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }

      # ----- WINDOW SHORTCUTS  ----- #
      {
        key = "<C-w>";
        action = ":vnew<CR>";
      }
      {
        key = "<C-w>h";
        action = ":new<CR>";
      }
    ];
  };
}
