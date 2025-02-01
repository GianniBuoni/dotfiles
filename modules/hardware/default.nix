{systemSettings, ...}: {
  imports =
    [
      ./disk-config.nix
      ./main.nix
      ./qmk.nix
    ]
    ++ (
      if (systemSettings.formFactor == "laptop")
      then [
        ./asus.nix
        ./nvidia.nix
        ./nvidia-offload.nix
      ]
      else []
    )
    ++ (
      if (systemSettings.formFactor == "homelab")
      then [
        ./nvidia.nix
      ]
      else []
    );
}
