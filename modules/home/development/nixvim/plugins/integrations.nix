# Set of integrations with other installed apps
{
  programs.nixvim = {
    plugins = {
      lazygit = {
        enable = true;
        settings.floating_window_use_plenary = 1;
      };
      tmux-navigator.enable = true;
      yazi = {
        enable = true;
        # Todo: add more settings
      };
    };
    keymaps = let
      mkMapping = key: action: {
        key = "<leader>${key}";
        action = "<CMD>${action}<CR>";
      };
    in [
      (
        mkMapping
        "ll"
        "LazyGit"
      )
      (
        mkMapping
        "yy"
        "Yazi"
      )
    ];
  };
}
