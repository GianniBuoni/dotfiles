{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./nvidia.nix
      ./qmk.nix
    ]
    ++ (
      if (systemSettings.formFactor == "laptop")
      then [
        ./nvidia-offload.nix
        ./hardware-config/laptop.nix
      ]
      else [
        ./hardware-config/handheld.nix
      ]
    );
}
