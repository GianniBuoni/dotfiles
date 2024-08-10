# Set of integrations with other installed apps
{
  programs.nixvim = {
    plugins = {
      lazygit = {
        enable = true;
        settings.floating_window_use_plenary = true;
      };
      tmux-navigator.enable = true;
      #yazi.enable = true;
    };
    keymaps = [
      {
        key = "<leader>ll";
        action = "<CMD>LazyGit<CR>";
      }
    ];
  };
}
