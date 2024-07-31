{
  pkgs,
  systemSettings,
  ...
}: {
  # Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Host Name and Networking
  networking.hostName = systemSettings.hostName;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable SSH
  services.openssh.enable = true;

  # Enable Nix Flakes
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    settings.trusted-users = [
      "root"
      "@wheel"
    ];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "24.05";
}
