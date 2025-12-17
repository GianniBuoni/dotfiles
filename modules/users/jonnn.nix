let
  userName = "jonnn";
  passKey = "passwords/${userName}/hashed";
in {
  flake.aspects = {aspects, ...}: {
    ${userName} = {
      includes = with aspects; [
        art
        browsers
        desktop
        fileSync
        git
        shell
        (sops._.users "${userName}" "1000")
        (ssh._.users "${userName}" "dev")
        textEditing
      ];

      nixos = {
        config,
        pkgs,
        ...
      }: {
        sops.secrets.${passKey}.neededForUsers = true;

        users.mutableUsers = false;
        users.users.${userName} = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets.${passKey}.path;
          extraGroups = ["wheel" "networkmanager" "docker"];
          shell = pkgs.zsh;
        };
      };

      homeManager = {};
    };
  };
}
