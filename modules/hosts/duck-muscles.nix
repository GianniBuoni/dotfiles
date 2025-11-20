{config, ...}: let
  hostName = "duck-muscles";
in {
  nixosHosts.${hostName}.hostData = {
    inherit hostName;
    stateVersion = "24.05";
    theme = "rose-pine";
  };

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects; [
        nixosCore
      ];
      nixos.imports = [config.flake.modules.${hostName}.${hostName}];
      ${hostName} = {};
    };
  };
}
