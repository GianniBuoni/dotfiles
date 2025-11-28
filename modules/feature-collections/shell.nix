{
  flake.aspects = {aspects, ...}: {
    shell.includes = with aspects; [
      zsh
    ];
  };
}
