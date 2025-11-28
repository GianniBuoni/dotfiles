# modules core to a nixos system.
# needed for fs, boot, and networking
{
  flake.aspects = {aspects, ...}: {
    nixosCore._.host = hostName: {
      includes = with aspects; [
        boot
        disko
        disko._.${hostName}
        git
        io
        locales
        networking
        nixSettings
        shell
        sops
        systemManagement
      ];
    };
  };
}
