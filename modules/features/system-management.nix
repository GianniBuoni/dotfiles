{
  flake.aspects.systemManagement.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      bashmount
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
