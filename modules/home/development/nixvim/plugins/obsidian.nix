{
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;
      settings.ui.enable = true;
      settings.workspaces = let
        mkWorkspace = name: {
          inherit name;
          path = "~/Documents/vault/${name}";
        };
      in [
        (
          mkWorkspace
          "development"
        )
      ];
    };
    opts = {
      conceallevel = 1;
    };
  };
}
