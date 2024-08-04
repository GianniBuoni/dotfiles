{systemSettings, ...}: {
  imports =
    [
      ./nix-system.nix
      ./dotfiles.nix
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then [./docker.nix]
      else
        [
          ./node.nix
          ./ags-types.nix
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
