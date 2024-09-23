{
  pkgs,
  systemSettings,
  lib,
  ...
}: {
  # Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Host Name and Networking
  networking.hostName = systemSettings.hostName;

  # Enable networking
  networking.networkmanager.enable = true;

  services = {
    # Enable SSH
    openssh.enable = true;
    zerotierone = {
      enable = true;
      joinNetworks = [
        "${systemSettings.zeroTier}"
      ];
    };
  };

  # Enable Nix Flakes
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    settings.trusted-users = [
      "root"
      "@wheel"
    ];
    optimise.automatic = true;
    gc = lib.mkIf (systemSettings.formFactor != "homelab") {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "24.05";
}
