{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 600; # 10 min
          on-timeout = "loginctl lock-session";
        }
        # {
        #   timeout = 1800; # 30 min
        #   on-timeout = "systemctl suspend";
        # }
      ];
    };
  };
}
