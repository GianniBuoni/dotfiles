{systemSettings, ...}: {
  imports =
    [
      ./nix-system.nix
      ./obsidian.nix
      ./workspace.nix
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then [./docker.nix]
      else
        [
          ./node.nix
          ./ags-types.nix
          ./rotate-monitor.nix
        ]
        ++ (
          if (systemSettings.formFactor == "laptop")
          then [
            ./clamshell-mode.nix
          ]
          else []
        )
    );
}
