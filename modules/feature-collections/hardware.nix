# related hardware modules for an asus laptop
let
  asus = "asusLaptop";
  latitude = "latitude";
in {
  flake.aspects = {aspects, ...}: {
    hardware._ = {
      ${asus} = {
        includes = with aspects; [
          asusd
          nvidia
          nvidia._.${asus}
        ];

        nixos = {};
      };

      ${latitude}.nixos = {pkgs, ...}: {
        hardware = {
          cpu.intel.updateMicrocode = true;
          firmware = with pkgs; [linux-firmware];
        };
      };
    };
  };
}
