{
  flake.aspects.greetd.nixos = {
    services.greetd.enable = true;
  };

  flake.aspects.greetd.duck-muscles = {
    pkgs,
    config,
    ...
  }: let
    userName = toString (builtins.elemAt config.hostData.users 0);
  in {
    services.greetd.settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd hyprland";
        user = userName;
      };
    };
  };
}
