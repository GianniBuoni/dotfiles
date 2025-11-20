# modules core to a nixos system.
# needed for fs, boot, and networking
{
  flake.aspects = {aspects, ...}: {
    nixosCore = {
      includes = with aspects; [
        boot
        disko
      ];
    };
  };
}
