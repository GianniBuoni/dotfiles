{systemSettings, ...}: {
  imports =
    [
      ./gaming
      ./hardware
      ./system
      ./stylix
    ]
    ++ (
      if (systemSettings.formFactor == "handheld")
      then [./jovian]
      else []
    );
}
