{
  flake.aspects.io.nixos = {
    services = {
      # Audio
      pipewire.enable = true;

      # Keyboard
      xserver.enable = true;
      xserver.xkb = {
        layout = "us";
        variant = "";
      };

      printing.enable = true; # Enable CUPS to print documents.
      udisks2.enable = true;
    };

    hardware.bluetooth.enable = true;
    hardware.graphics = {
      enable = true;
      enable32Bit = true; # Enable Open GL
    };
  };
}
