{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./gnome.nix
      ./grub-boot.nix
      ./users.nix
      ./programs.nix
      ./users.nix
    ]
    ++ (
      if (systemSettings.formFactor == "laptop")
      then [./hyprland.nix]
      else []
    );
}
