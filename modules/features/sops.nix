{inputs, ...}: let
  secretsPath = builtins.toString inputs.secrets;
  defaultSopsFile = "${secretsPath}/secrets.yaml";
in {
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    secrets = {
      url = "git+ssh://git@github.com/GianniBuoni/secrets.git?ref=main&shallow=1";
      flake = false;
    };
  };

  flake.aspects.sops = {
    nixos = {
      imports = [inputs.sops-nix.nixosModules.sops];

      sops = {
        inherit defaultSopsFile;

        age = {
          sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
          keyFile = "/var/lib/sops-nix/key.txt";
          generateKey = true;
        };
      };
    };

    _.users = userName: uid: {
      homeManager = {
        imports = [inputs.sops-nix.homeManagerModules.sops];

        sops = {
          inherit defaultSopsFile;
          defaultSymlinkPath = "/run/user/${uid}/secrets";
          defaultSecretsMountPoint = "/run/user/${uid}/secrets.d";

          age = {
            sshKeyPaths = ["/home/${userName}/.ssh/id_ed25519"];
            keyFile = "/home/${userName}/.config/sops/age/keys.txt";
            generateKey = true;
          };
        };
      };
    };
  };
}
