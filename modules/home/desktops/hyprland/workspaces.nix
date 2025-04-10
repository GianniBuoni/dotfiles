let
  gamingSpace = "3";
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*" # You'll probably like this.
      "idleinhibit fullscreen, fullscreen:1" # To make sure hypridle doesn't lock you out of video watching
    ];
    windowrule = [
      "workspace ${gamingSpace} silent,steam"
      "workspace ${gamingSpace}, moonlight"
    ];
    workspace = [
      "1,monitor:desc:ASUSTek COMPUTER INC PA32UCDM T1LMSB000539,default:true"
      "2,monitor:desc:HAT Kamvas Pro 19 0xF0000005,default:true"
    ];
  };
}
