{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,us";
      kb_variant = ",colemak_dh";
      kb_options = "grp:alt_shift_toggle";

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
      };
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
