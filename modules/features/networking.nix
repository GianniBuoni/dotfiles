{
  flake.aspects.networking = {
    nixos = {
      lib,
      config,
      pkgs,
      ...
    }: let
      inherit (config) hostData;
    in {
      sops.secrets."wifi.env" = {};

      environment.systemPackages = with pkgs; [
        curl
        dig
        wget
      ];

      networking = {
        inherit (hostData) hostName;
        networkmanager.enable = true;
        networkmanager.ensureProfiles = {
          environmentFiles = [config.sops.secrets."wifi.env".path];
          profiles.home-wifi = {
            connection = {
              id = "home-wifi";
              type = "wifi";
            };
            wifi.ssid = "$HOME_WIFI_SSID";
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$HOME_WIFI_PSK";
            };
          };
        };
      };

      services.openssh = {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
        };
      };
    };

    _.duck-muscles.nixos = {
      services = {
        nfs.server.enable = true;
        tailscale.enable = true;
      };
    };
  };
}
