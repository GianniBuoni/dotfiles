{
  config,
  lib,
  ...
}: let
  lib' = config.flake.lib;
  modules = config.flake.modules;
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
      includes = with aspects; [
        nixosCore
        greetd
      ];
      nixos.imports =
        [modules.${hostName}.${hostName}]
        ++ lib.map lib'.mkUser config.nixosHosts.${hostName}.hostData.users;
      ${hostName} = {};
    };
  };
}
