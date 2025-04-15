let
  gamingSpace = "3";
in {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "suppressevent maximize, class:.*" # You'll probably like this.
      "idleinhibit fullscreen, fullscreen:1" # To make sure hypridle doesn't lock you out of video watching
      "workspace ${gamingSpace} silent, class:^(steam)$"
      "workspace ${gamingSpace}, title:^(Moonlight)$"
    ];
    workspace = [
      "1,DP-5,default:true"
      "2,monitor:desc:HAT Kamvas Pro 19 0xF0000005,default:true"
    ];
  };
}
