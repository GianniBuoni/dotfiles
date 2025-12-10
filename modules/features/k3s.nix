let
  tokenPath = "clusterToken";
in {
  flake.aspects.k3s = {
    # base k3s clusetr config
    nixos = {
      networking.firewall = {
        allowedTCPPorts = [6443];
        allowedUDPPorts = [8472];
      };

      services.k3s = {
        enable = true;
        extraFlags = toString ["--disable-helm-controller"];
      };
    };
    _ = {
      # test-host is a single node custer
      singleNode.nixos.services.k3s.role = "server";

      # common multi-node cluster configs
      multiNode.nixos = {config, ...}: {
        sops.secrets.${tokenPath} = {
          owner = config.users.users.k3s-user.name;
          inherit (config.users.users.k3s-user) group;
        };

        services.k3s.tokenFile = config.sops.secrets.${tokenPath}.path;
      };

      # node configs
      serverNode.nixos.services.k3s = {
        role = "server";
        clusterInit = true;
      };

      agentNode.nixos.services.k3s = {
        role = "agent";
      };
    };
  };
}
