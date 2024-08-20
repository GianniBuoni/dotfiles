{userSettings, ...}: {
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;
      settings.ui.enable = true;
      settings.workspaces = let
        mkWorkspace = name: {
          inherit name;
          path = "/home/${userSettings.userName}/vaults/${name}";
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
    keymaps = let
      mkMapping = key: action: desc: {
        key = "<leader>${key}";
        action = "<CMD>${action}<CR>";
        options.desc = "${desc}";
      };
    in [
      (
        mkMapping
        "oot" #codespell:ignore ot
        
        "ObsidianTags"
        "[O]bsidian [T]ags"
      )
      (
        mkMapping
        "oon"
        "ObsidianNew"
        "[O]bsidian [N]ew"
      )
    ];
  };
}
