{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./qmk.nix
    ]
    ++ (
      if (systemSettings.formFactor == "laptop")
      then [
        ./nvidia.nix
        ./nvidia-offload.nix
        ./hardware-config/laptop.nix
      ]
      else [
        ./hardware-config/handheld.nix
      ]
    );
}
