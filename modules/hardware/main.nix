{
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

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

    # Power Profiles Daemon
    power-profiles-daemon.enable = true;
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
