{
  pkgs,
  systemSettings,
  ...
}: {
  # Bootloader.
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };

    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Host Name and Networking
  networking.hostName = systemSettings.hostName;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Nix Flakes
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "24.05";
}
