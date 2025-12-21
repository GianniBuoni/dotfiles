{
  flake.aspects.virtualization = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        docker
        docker-compose
      ];

      virtualisation.docker.enable = true;
    };

    _.duck-muscles.nixos = {pkgs, ...}: {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };
  };
}
