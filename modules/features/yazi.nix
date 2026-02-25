{
  flake.aspects.yazi.homeManager.programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    settings.opener.edit = [
      {
        run = "hx $@";
        block = true;
        desc = "Open in Helix";
      }
    ];
  };
}
