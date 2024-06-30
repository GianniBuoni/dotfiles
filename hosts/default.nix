{
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ./${systemSettings.hostName}
  ];

  boot = {
    loader = {
      # Bootloader.
      #grub = {
      #  enable = true;
      #  efiSupport = true;
      #  device = "nodev";
      #};
      efi = {
        canTouchEfiVariables = true;
        # efiSysMountPoint = "/boot";
      };
      systemd-boot.enable = true;
    };

    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Host Name and Networking
  networking.hostName = systemSettings.hostName;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
