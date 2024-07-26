{systemSettings, ...}: {
  imports =
    [
      ./dotfiles.nix
      ./nix-system.nix
      ./node.nix
      ./ags-types.nix
    ]
    ++ (
      if (systemSettings.formFactor == "laptop")
      then [
        ./clamshell-mode.nix
      ]
      else []
    );
}
