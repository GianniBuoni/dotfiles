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
      if (systemSettings.formFactor == "handheld")
      then [./gnome-extensions.nix]
      else [./hyprland.nix]
    );
}
