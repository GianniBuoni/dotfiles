let
  userName = "jonnn";
  passKey = "hashedPasswords/${userName}";
in {
  flake.aspects = {aspects, ...}: {
    ${userName} = {
      includes = with aspects; [
        (ssh._.users "${userName}" "dev")
        art
        browsers
        desktop
        shell
        textEditing
        fileSync
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
          extraGroups = ["wheel" "networkmanager"];
          shell = pkgs.zsh;
        };
      };

      homeManager = {};
    };
  };
}
