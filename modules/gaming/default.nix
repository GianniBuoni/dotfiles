{systemSettings, ...}: {
  imports =
    [
      ./core-pograms.nix
      ./proton.nix
      ./moonlignt.nix
    ]
    ++ (
      if (systemSettings.formFactor == "desktop")
      then [
        ./sunshine.nix
      ]
      else []
    );
}
