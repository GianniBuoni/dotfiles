{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./art
      ./development
      ./productivity
      ./shell-scripts
    ]
    ++ (
      if (systemSettings.formFactor == "handheld")
      then []
      else [
        ../stylix/main.nix
        ./desktops
        ./desktops/waybar
      ]
    );
}
