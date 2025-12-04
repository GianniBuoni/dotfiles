{config, ...}: let
  hostName = "test-host-gui";
  font = "JetBrainsMono";
  aspects = config.flake.aspects;

  nixosHosts.${hostName} = {
    hostData = {
      inherit hostName;
      users = ["jonnn" "k3s-user"];
    };
    themeSettings.palette = "dracula";
    themeSettings.font = {
      name = "${font}";
      nerd = "${font} Nerd Font";
      package = "jetbrains-mono";
    };
    themeSettings.cursor = {
      name = "Bibata-Modern-Classic";
      package = "bibata-cursors";
    };
  };
in {
  inherit nixosHosts;

  flake.aspects.${hostName} = {
    description = ''
      Test host that has graphical interface.
    '';
    includes = with aspects; [
      (nixosCore._.host "${hostName}")
      greetd
      hardware._.latitude
      k3s
      k3s._.singleNode
      stylix
      virtualization

      # import users manually due to different needs
      (homeManager._.users "jonnn")
      k3s-user
    ];

    nixos = {};
  };
}
