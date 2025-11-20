{systemSettings, ...}: {
  imports =
    [
      ./docker.nix
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then [
        ./homelab.nix
      ]
      else
        [
          ./rotate-monitor.nix
        ]
        ++ (
          if (systemSettings.formFactor == "laptop")
          then [
            ./clamshell-mode.nix
          ]
          else []
        )
    );
}
