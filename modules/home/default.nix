{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./art
      ./development
      ./productivity
      ./shell-scripts
      ../stylix/main.nix
    ]
    ++ (
      if (systemSettings.formFactor == "handheld")
      then []
      else [
        ./desktops
        ./desktops/waybar
      ]
    );
}
