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

    # HIGHLIGHTING
    opts.hlsearch = true;

    # KEYMAPPING PROPER
    keymaps = let
      mkMapping = key: action: {
        inherit key;
        action = "<cmd>${action}<CR>";
      };
    in [
      # HIGHLIGHTING pt. 2
      (
        mkMapping
        "<Esc>"
        "nohlsearch"
      )
      # WINDOW BINDINGS
      (
        mkMapping
        "<C-w>"
        "new"
      )
      (
        mkMapping
        "<C-w>v"
        "vnew"
      )
    ];
  };
}
