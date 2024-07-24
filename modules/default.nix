{systemSettings, ...}: {
  imports =
    [
      ./gaming
      ./hardware
      ./system
    ]
    ++ (
      if (systemSettings.formFactor == "laptop")
      then [./stylix]
      else []
    );
}
