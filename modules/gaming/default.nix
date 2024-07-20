{systemSettings, ...}: {
  imports =
    [
      ./main.nix
    ]
    ++ (
      if (systemSettings.formFactor == "desktop")
      then [
        ./sunshine.nix
      ]
      else []
    );
}
