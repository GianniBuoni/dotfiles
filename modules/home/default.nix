{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./development
      ./shell-scripts
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then []
      else [
        ./art
        ./desktops
        ./productivity
      ]
    );
}
