{
  flake.aspects.nixSettings.nixos = {config, ...}: let
    trustedUser = toString (builtins.elemAt config.hostData.users 0);
  in {
    nix = {
      settings.experimental-features = ["nix-command" "flakes"];
      settings.trusted-users = [trustedUser];
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}
