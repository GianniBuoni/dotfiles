{
  lib,
  config,
  ...
}: let
  lib' = config.flake.lib;
  hostName = "duck-muscles";
in {
  nixosHosts.${hostName}.hostData = {
    inherit hostName;
    stateVersion = "24.05";
    theme = "rose-pine";
    users = ["jonnn"];
  };

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects;
        [
          (nixosCore._.host "${hostName}")
          asusLaptop
          gaming
          greetd
          tablets
          virtualization
        ]
        ++ lib.map lib'.mkUser config.nixosHosts.${hostName}.hostData.users;

      nixos = {};
    };
  };
}
