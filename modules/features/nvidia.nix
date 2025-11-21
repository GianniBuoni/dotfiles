{
  flake.aspects.nvidia.nixos = {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
    };
  };

  flake.aspects.nvidia._.asusLaptop.nixos = {
    hardware.nvidia.prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:65:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
