{
  flake.aspects.fuzzel.homeManager = {
    pkgs,
    lib,
    ...
  }: {
    programs.fuzzel.enable = true;
    programs.fuzzel.settings.main = {
      terminal = "${pkgs.zsh}/bin/zsh";
      horizontal-pad = 10;
      width = 80;
      # override stylix
      font = lib.mkForce "JetBrainsMonoNL Nerd Font:size=10";
    };
  };
}
