# related hardware modules for an asus laptop
let
  asus = "asusLaptop";
in {
  flake.aspects = {aspects, ...}: {
    hardware._ = {
      ${asus} = {
        includes = with aspects; [
          asusd
          nvidia
          nvidia._.${asus}
        ];

        nixos = {pkgs, ...}: {
          hardware = {
            cpu.amd.updateMicrocode = true;
            firmware = with pkgs; [linux-firmware];
          };
        };
      };

      intel.nixos = {pkgs, ...}: {
        hardware = {
          cpu.intel.updateMicrocode = true;
          firmware = with pkgs; [linux-firmware];
        };
      };

      amd.nixos = {pkgs, ...}: {
        hardware = {
          cpu.amd.updateMicrocode = true;
          firmware = with pkgs; [linux-firmware];
        };
      };
    };
  };
}
