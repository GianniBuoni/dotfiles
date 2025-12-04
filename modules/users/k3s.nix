let
  userName = "k3s-user";
  passKey = "hashedPasswords/k3s";
in {
  flake.aspects = {aspects, ...}: {
    ${userName} = {
      includes = with aspects; [
        (ssh._.users "${userName}" "dev")
      ];

      nixos = {config, ...}: {
        sops.secrets.${passKey}.neededForUsers = true;

        users.users.${userName} = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets.${passKey}.path;
          extraGroups = ["wheel"];
        };
      };
    };
  };
}
