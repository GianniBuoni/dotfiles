{lib, ...}: {
  services.xserver.displayManager.startx.enable = lib.mkForce true;

  networking = {
    interfaces.enp0s13f0u3u4.ipv4.addresses = [
      {
        address = "192.168.1.2";
        prefixLength = 24;
      }
    ];
    firewall.allowedTCPPorts = [8123]; # Needed for Home Assistant to work in host mode
  };
}
