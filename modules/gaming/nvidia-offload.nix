{
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        amdgpuBusId = "PCI:65:0:0";

        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
