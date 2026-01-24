{
  flake.aspects = {aspects, ...}: {
    shell = {
      includes = with aspects; [
        zsh
        zellij
        starship
        terminalEmulators
      ];

      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          direnv
          just
          fzf
          eza
          ripgrep
          starship
          zoxide
        ];
      };

      homeManager = {
        programs = {
          direnv.enable = true;
          fzf.enable = true;
          eza.enable = true;
          ripgrep.enable = true;
          zoxide.enable = true;
        };
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
  };
}
