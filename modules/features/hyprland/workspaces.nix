let
  gamingSpace = "3";
in {
  flake.aspects.hyprland.homeManager = {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        "suppress_event maximize, match:class *" # You'll probably like this.
        # To make sure hypridle doesn't lock you out of video watching
        "idle_inhibit fullscreen, match:fullscreen 1"
        "workspace ${gamingSpace} silent, match:class ^(steam)$"
        "workspace ${gamingSpace}, match:title ^(Moonlight)$"
      ];
      workspace = [
        "1,monitor:eDP-1,default:true"
        "2,monitor:DP-5,default:true"
      ];
    };
  };
}
