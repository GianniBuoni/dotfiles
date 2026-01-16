{config, ...}: let
  inherit (config.flake.lib) mkEsp mkFs mkEmpty mkLuks mkSwap;

  ESP = mkEsp "1G";
  luks = mkLuks "100%";
  swap = mkSwap "4G";

  mkDisk = device: {
    type = "disk";
    inherit device;
    content = {
      type = "gpt";
      partitions = {inherit ESP luks;};
    };
  };
in {
  flake.aspects.disko._ = let
    diskoSettings = {
      disk = {ssd = mkDisk "/dev/nvme0n1";};
      lvm_vg.vg = {
        type = "lvm_vg";
        lvs = {
          inherit swap;
          root = mkFs "ext4" "64G" "/";
          osd = mkEmpty "100%";
        };
      };
    };
  in {
    sleepy-gary-00.nixos.disko.devices = diskoSettings;
    sleepy-gary-02.nixos.disko.devices = diskoSettings;
  };
}
