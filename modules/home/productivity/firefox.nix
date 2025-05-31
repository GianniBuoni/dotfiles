{inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs = {
    firefox.enable = true;
    chromium.enable = true;
    zen-browser = {
      enable = true;
      policies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
      };
    };
  };
}
