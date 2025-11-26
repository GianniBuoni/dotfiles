{config, ...}: let
  inherit (config.flake.lib) mkFs;
in {
  flake.aspects.disko._.test-host.nixos = {
    disko.devices.disk.ssd = let
      # define the boot partiton
      ESP = {
        size = "1G";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
          mountOptions = ["umask=0077"];
        };
      };
      # define luks partition
      luks = {
        size = "100%";
        content = {
          type = "luks";
          name = "crypted";
          passwordFile = "/tmp/secret.key";
          settings.allowDiscards = true;
          content = {
            type = "lvm_pv";
            vg = "vg";
          };
        };
      };
    in {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {inherit ESP luks;};
      };
    };

    # define logical volumes
    disko.devices.lvm_vg.vg = {
      type = "lvm_vg";
      lvs = {
        swap = {
          size = "4G";
          content = {
            type = "swap";
            discardPolicy = "both";
          };
        };
        root = mkFs "ext4" "5G" "/";
      };
    };
  };
}
