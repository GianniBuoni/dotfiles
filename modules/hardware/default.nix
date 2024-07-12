{
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # Enable Open GL
    };
    pulseaudio.enable = false; # Enable sound with pipewire.
  };

  security.rtkit.enable = true;
}
