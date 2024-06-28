{
  programs.nixvim.plugins.telescope.enable = true;
  programs.nixvim.keymaps = [
    {
      key = "<leader>ff"; # [F]ind [F]iles
      action = ":Telescope find_files<CR>";
    }
    {
      key = "<leader>fg"; # [F]ind [G]rep
      action = ":Telescope live_grep<CR>";
    }
  ];
}
