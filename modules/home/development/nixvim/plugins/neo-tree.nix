{
  programs.nixvim.plugins.neo-tree.enable = true;
  programs.nixvim.keymaps = [
    {
      key = "<C-o>";
      action = ":Neotree toggle left<CR>";
    }
  ];
}
