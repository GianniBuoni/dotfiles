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
        ./homelab.nix
      ]
      else [
        ./hyprland.nix
        ./plasma.nix
      ]
    );
}
