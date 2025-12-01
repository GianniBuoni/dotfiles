{
  flake.aspects.options.hosts = {lib, ...}: {
    options.hostData = with lib; {
      # has defaults
      system = mkOption {
        description = ''Host's hostPlatform'';
        type = types.str;
        default = "x86_64-linux";
      };
      stateVersion = mkOption {
        description = ''Host's original nixos version'';
        type = types.str;
        default = "25.11";
      };
      hasHomeManager = mkOption {
        description = ''Bool to allow user's home-manager cofnigs'';
        type = types.bool;
        default = true;
      };
      # required to be set
      hostName = mkOption {
        description = ''Host's hostname; should match nixosHost submodule'';
        type = types.str;
      };
      users = mkOption {
        description = ''List of host's users'';
        type = types.listOf types.str;
      };
    };
  };
}
