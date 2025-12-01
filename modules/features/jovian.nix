{
  flake.aspects.jovian = {
    nixos = {
      # Make sure to enable CEF Debugging in the Steam Developer Settings!
      jovian.decky-loader.enable = true;
      jovian.steam = {
        enable = true;
        autoStart = true;
      };
    };
    # host-level overlay
    _.hosts = user: desktopSession: {
      nixos = {
        jovian.steam = {inherit user desktopSession;};
        services.handheld-daemon = {
          enable = true;
          inherit user;
        };
      };
    };
  };
}
