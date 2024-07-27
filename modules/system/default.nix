{systemSettings, ...}: {
  imports =
    [
      ./main.nix
      ./grub-boot.nix
      ./users.nix
      ./programs.nix
      ./users.nix
    ]
    ++ (
      if (systemSettings.formFactor == "handheld")
      then [
        ./gnome.nix
        ./gnome-extensions.nix
      ]
      else [
        ./hyprland.nix
      ]
    );
}
