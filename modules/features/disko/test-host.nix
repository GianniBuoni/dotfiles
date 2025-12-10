{config, ...}: let
  inherit (config.flake.lib) mkEsp mkFs mkLuks mkSwap;

  ESP = mkEsp "1G";
  luks = mkLuks "100%";
  swap = mkSwap "4G";

  ssd = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions = {inherit ESP luks;};
    };
  };
in {
  flake.aspects.disko._ = {
    test-host.nixos = {
      disko.devices = {
        disk = {inherit ssd;};

        # define logical volumes
        lvm_vg.vg = {
          type = "lvm_vg";
          lvs = {
            inherit swap;
            root = mkFs "ext4" "5G" "/";
          };
        };
      };
    };

    test-host-gui.nixos = {
      disko.devices = {
        disk = {inherit ssd;};

        # define logical volumes
        lvm_vg.vg = {
          type = "lvm_vg";
          lvs = {
            inherit swap;
            root = mkFs "ext4" "100%" "/";
          };
        };
      };
    };
  };
}
