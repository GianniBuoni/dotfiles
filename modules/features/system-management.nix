{
  flake.aspects.systemManagement.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      bashmount
      btop
      efibootmgr
      exiftool
      fastfetch
      lshw
      pciutils
      unzip
    ];

    services.power-profiles-daemon.enable = true;
    security.rtkit.enable = true;
  };
}
