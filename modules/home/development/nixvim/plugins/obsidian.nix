{
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;
      settings.ui.enable = true;
      settings.workspaces = let
        mkWorkspace = name: {
          inherit name;
          path = "~/Documents/vaults/${name}";
        };
      in [
        (
          mkWorkspace
          "development"
        )
        (
          mkWorkspace
          "personal"
        )
      ];
    };
    opts = {
      conceallevel = 1;
    };
  };
}
