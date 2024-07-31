{systemSettings, ...}: {
  imports =
    [
      ./nix-system.nix
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then []
      else
        [
          ./dotfiles.nix
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
