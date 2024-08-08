{
  services = {
    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Keyboard
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    power-profiles-daemon.enable = true; # Power Profiles Daemon
    printing.enable = true; # Enable CUPS to print documents.
    udisks2.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # Enable Open GL
    };
    pulseaudio.enable = false; # Enable sound with pipewire.
    bluetooth.enable = true;
  };

  security.rtkit.enable = true;
}
