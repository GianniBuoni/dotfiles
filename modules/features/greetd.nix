{
  flake.aspects.greetd.nixos = {
    pkgs,
    config,
    ...
  }: let
    userName = toString (builtins.elemAt config.hostData.users 0);
  in {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd hyprland";
          user = userName;
        };
      };
    };
  };
}
