{
  flake.aspects.disko._.duck-muscles.nixos = {
    disko.devices = {
      disk.disk1.device = "/dev/nvme0n1";
      disk.disk1.type = "disk";
      disk.disk1.content = {
        type = "gpt";
        partitions = {
          esp = {
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          nixos = {
            name = "nixos";
            end = "-8192M";
            content = {
              type = "filesystem";
              format = "btrfs";
              mountpoint = "/";
            };
          };
          swap = {
            name = "swap";
            size = "100%";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
        };
      };
    };
  };
}
