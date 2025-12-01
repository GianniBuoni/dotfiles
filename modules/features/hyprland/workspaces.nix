let
  gamingSpace = "3";
in {
  flake.aspects.hyprland.homeManager = {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        "suppressevent maximize, class:.*" # You'll probably like this.
        # To make sure hypridle doesn't lock you out of video watching
        "idleinhibit fullscreen, fullscreen:1"
        "workspace ${gamingSpace} silent, class:^(steam)$"
        "workspace ${gamingSpace}, title:^(Moonlight)$"
      ];
      workspace = [
        "1,monitor:DP-5,default:true"
        "2,monitor:eDP-1,default:true"
      ];
    };
  };
}
