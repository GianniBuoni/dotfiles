{
  config,
  lib,
  modulesPath,
  userSettings,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8d7f8ef3-52e2-43f1-9974-86dac21db55f";
      fsType = "btrfs";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/251D-ADF8";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };

    "/home/${userSettings.userName}/Documents/external" = {
      device = "/dev/disk/by-uuid/E25E-85F2";
      fsType = "exfat";
      options = ["users" "nofail" "fmask=0022" "dmask=0022" "uid=1000" "gid=100" "exec"];
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/68a47d27-bb7a-41e7-b4c1-0c8c08d6c851";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
