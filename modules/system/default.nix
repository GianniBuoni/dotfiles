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
      then []
      else [./hyprland.nix]
    );
}
