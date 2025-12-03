{
  flake-file.inputs.zen-browser.url = "github:0xc000022070/zen-browser-flake";

  flake.aspects.browsers.homeManager = {inputs, ...}: {
    imports = [inputs.zen-browser.homeModules.beta];

    programs.firefox.enable = true;
    programs.chromium.enable = true;

    programs.zen-browser = {
      enable = true;
      policies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
      };
    };
  };
}
