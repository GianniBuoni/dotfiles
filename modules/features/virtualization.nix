{
  flake.aspects.virtualization.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      distrobox
      docker
      docker-compose
    ];

    virtualisation.docker.enable = true;
  };
}
