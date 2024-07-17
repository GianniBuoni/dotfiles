{
  pkgs,
  userSettings,
  ...
}: {
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {
        show_notifications = false;
        show_icon = false;
        search_trigger = "OFF";
        search_shortcut = "OFF";
        toggle_key = "OFF";
      };
    };
    matches = {
      global_vars = {
        global_vars = [
          {
            name = "currentdate";
            type = "date";
            params = {format = "%Y-%m-%d";};
          }
        ];
      };
      base = {
        matches = let
          mkMatch = trigger: replace: {
            inherit trigger replace;
          };
        in [
          # Normal
          (mkMatch ":date" "{{currentdate}}")
          (mkMatch ":na" "${userSettings.name}")
        ];
      };
    };
  };
}
