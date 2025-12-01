{
  lib,
  config,
  ...
}: let
  hostName = "test-host";
  aspects = config.flake.aspects;
  inherit (nixosHosts.${hostName}) hostData;

  mkUser = userName: {
    includes = [aspects."${userName}"];
    nixos = {};
  };

  mapUser = userName: aspects.${hostName}._.${userName};

  nixosHosts.${hostName}.hostData = {
    inherit hostName;
    users = ["jonnn"];
  };
in {
  inherit nixosHosts;

  flake.aspects.${hostName} = {
    includes = with aspects;
      [
        (nixosCore._.host "${hostName}")
        virtualization
      ]
      ++ lib.map mapUser hostData.users;

    nixos = {};
    # host provides user and user modules
    _ = lib.genAttrs hostData.users mkUser;
  };
}
