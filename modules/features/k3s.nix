let
  tokenPath = "cluster-secrets/prod/token";
in {
  flake.aspects = {aspects, ...}: {
    k3s = {
      # base k3s clusetr config
      nixos = {
        networking.firewall = {
          allowedTCPPorts = [6443];
          allowedUDPPorts = [8472];
        };

        services.k3s = {
          enable = true;
          extraFlags = toString [
            "--disable-helm-controller"
            "--disable=servicelb"
          ];
        };
      };

      _ = {
        # test-host is a single node custer
        singleNode.nixos.services.k3s.role = "server";

        multiNode = {
          includes = [(aspects.sops._.keyPaths "${tokenPath}")];

          # common multi-node cluster configs
          nixos = {
            config,
            lib,
            ...
          }: {
            networking.firewall.allowedTCPPorts = [2379 2380];

            services = {
              k3s.tokenFile = config.sops.secrets.${tokenPath}.path;
            };
          };
        };

        firstNode.nixos.services.k3s = {
          role = "server";
          clusterInit = true;
        };

        serverNode = firstIP: {
          nixos.services.k3s = {
            role = "server";
            serverAddr = "https://${firstIP}:6443";
          };
        };

        agentNode.nixos.services.k3s = {
          role = "agent";
        };
      };
    };
  };
}
