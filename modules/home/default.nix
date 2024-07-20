{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./development
      ./productivity
      ./shell-scripts
      ../stylix/main.nix
    ]
    ++ (
      if (systemSettings.formFactor == "handheld")
      then [
        ../stylix/targets.nix
      ]
      else [
        ./art
        ./desktops
        ./desktops/waybar
      ]
    );
}
