{systemSettings, ...}: {
  imports =
    [
      ./hardware
      ./system
      ./stylix
    ]
    ++ (
      if (systemSettings.formFactor == "homelab")
      then []
      else
        [
          ./gaming
        ]
    );
}
