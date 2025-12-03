{
  flake.aspects.fileSync.homeManager = {
    services.syncthing.enable = true;
  };
}
