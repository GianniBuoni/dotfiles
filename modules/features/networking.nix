{
  flake.aspects.networking.nixos = {
    lib,
    config,
    ...
  }: let
    inherit (config) hostData;
  in {
    sops.secrets = {
      "wifi.env" = {};
      "tokens/zerotier" = {};
    };

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

    # IMPURE requires secrets to already be bootstrapped to build
    services.zerotierone = let
      networkIdPath = ''${config.sops.secrets."tokens/zerotier".path}'';
    in {
      joinNetworks = lib.mkIf (builtins.pathExists networkIdPath) [
        (builtins.readFile networkIdPath)
      ];
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
}
