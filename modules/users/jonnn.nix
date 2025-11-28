{
  flake.aspects = {aspects, ...}: let
    userName = "jonnn";
  in {
    ${userName} = {
      includes = with aspects; [(ssh._.users "${userName}" "dev")];

      nixos = {
        config,
        pkgs,
        ...
      }: let
        passKey = "hashedPasswords/${userName}";
      in {
        sops.secrets.${passKey}.neededForUsers = true;

        programs.zsh.enable = true;

        users.mutableUsers = false;
        users.users.${userName} = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets.${passKey}.path;
          extraGroups = ["wheel" "networkmanager"];
          shell = pkgs.zsh;
        };
      };
    };
  };
}
