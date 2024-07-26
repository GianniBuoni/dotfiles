{
  programs.nixvim.plugins.telescope.enable = true;
  programs.nixvim.keymaps = let
    mkMapping = key: action: {
      key = "<leader>${key}";
      action = ":Telescope ${action}<CR>";
    };
  in [
    (
      mkMapping
      "ff"
      "find_files"
    )
    (
      mkMapping
      "fg"
      "live_grep"
    )
    (
      mkMapping
      "fr"
      "registers"
    )
  ];
}
