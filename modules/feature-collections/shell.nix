{
  flake.aspects = {aspects, ...}: {
    shell.includes = with aspects; [
      zsh
    ];

    nixos.programs = {
      fzf.enable = true;
      eza.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      zoxide.enable = true;
    };
  };
}
