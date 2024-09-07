{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./grub-boot.nix
      ./home-manager.nix
      ./systemPackages.nix
      ./users.nix
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then [
        ./static-ip-homelab.nix
      ]
      else [
        ./hyprland.nix
        ./plasma.nix
      ]
    );
}
