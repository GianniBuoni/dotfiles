{pkgs, ...}: {
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {
        show_notifications = false;
        show_icon = false;
        search_trigger = "OFF";
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
        matches = [
          {
            trigger = ":date";
            replace = "{{currentdate}}";
          }
          {
            trigger = ":gg";
            replace = "git add .";
          }
          {
            trigger = ":gc";
            replace = "git reset && git add . && git commit -m '";
          }
          {
            trigger = ":gp";
            replace = "git push origin ";
          }
          {
            trigger = ":gs";
            replace = "git status";
          }
          {
            trigger = ":nn";
            replace = "git add . -Nf && sudo nixos-rebuild switch --flake .";
          }
          {
            trigger = ":nh";
            replace = "git add . -Nf && home-manager switch --flake .";
          }
        ];
      };
    };
  };
}
