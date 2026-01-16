let
  clusterContext = "prod";
  tokenPath = "token";
in {
  flake.aspects = {aspects, ...}: {
    k3s = {
      # base k3s clusetr config
      nixos = {lib, ...}: {
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
        # containerd settings
        systemd.services.containerd.serviceConfig = {
          LimitNoFile = lib.mkForce null;
        };
        # boot paramaters for rook-ceph
        boot.kernelModules = ["rbd"];
      };

      _ = {
        # test-host is a single node custer
        singleNode.nixos.services.k3s.role = "server";

        multiNode = {
          includes = [
            (aspects.sops._.clusters "${clusterContext}" "${tokenPath}")
          ];

          # common multi-node cluster configs
          nixos = {
            networking.firewall.allowedTCPPorts = [2379 2380];
          };
        };

        firstNode.nixos.services.k3s = {
          role = "server";
          clusterInit = true;
        };

        serverNode = firstIP: {
          nixos = {config, ...}: {
            services.k3s = {
              role = "server";
              serverAddr = "https://${firstIP}:6443";
              tokenFile = config.sops.secrets."${clusterContext}/${tokenPath}".path;
            };
          };
        };

        agentNode.nixos.services.k3s = {role = "agent";};
      };
    };
  };
}
