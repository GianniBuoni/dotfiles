{
  flake.aspects.tablets.nixos = {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
      blacklistedKernelModules = [
        "hid-uclogic"
        "wacom"
      ];
    };
  };
}
