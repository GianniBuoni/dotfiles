{
  flake.aspects = {aspects, ...}: {
    shell.includes = with aspects; [
      zsh
      zellij
      terminalEmulators
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        just
      ];

      programs = {
        fzf.enable = true;
        eza.enable = true;
        ripgrep.enable = true;
        starship.enable = true;
        zoxide.enable = true;
      };
    };

    homeManager = {
      programs.direnv.enable = true;
      programs.yazi = {
        enable = true;
        settings.opener.edit = [
          {
            run = "hx $@";
            block = true;
            desc = "Open in Helix";
          }
        ];
      };
    };
  };
}
