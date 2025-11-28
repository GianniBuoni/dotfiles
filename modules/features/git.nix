let
  enable = true;
in {
  flake.aspects.git = {
    nixos.programs = {
      git = {inherit enable;};
      gh = {inherit enable;};
    };

    homeManager = {config, ...}: let
      secrets = config.sops.secrets;

      secretKeys = {
        userName = "git/userName";
        userEmail = "git/userName";
      };

      secretValues = {
        userName = builtins.readFile secrets.${secretKeys.userEmail}.path;
        userEmail = builtins.readFile secrets.${secretKeys.userName}.path;
      };
    in {
      sops.secrets = {
        inherit (secretKeys) userName userEmail;
      };

      programs = {
        gh = {inherit enable;};
        git = {
          inherit enable;
          inherit (secretValues) userName userEmail;

          extraConfig.init.defaultBranch = "main";

          ignores = [
            ".DS_Store"
            ".env"
            ".env.local"
          ];
        };

        lazygit = {enable = true;};
      };
    };
  };
}
