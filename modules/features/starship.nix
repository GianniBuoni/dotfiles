{
  flake.aspects.starship = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        starship
      ];
    };

    homeManager = {
      programs.starship = {
        enable = true;
        settings.kubernetes = {
          symbol = "🌊 ";
          detect_env_vars = ["CLUSTER_BRANCH"];
          disabled = false;
        };
        settings.env_var.CLUSTER_BRANCH = {
          variable = "CLUSTER_BRANCH";
          style = "cyan bold";
        };
      };
    };
  };
}
