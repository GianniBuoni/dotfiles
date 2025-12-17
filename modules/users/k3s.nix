let
  userName = "k3s-user";
  passKey = "passwords/k3s/hashed";
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
