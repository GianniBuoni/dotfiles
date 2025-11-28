# user level ssh configurations
let
  dev-machine = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDbNe1fwEsVI9zMFX+0tPB+mHbc4VzrnGE/t9MrwDsoq";
  publicKeys = {
    dev = [dev-machine];
  };
in {
  flake.aspects.ssh._.users = userName: keyList: {
    nixos = {config, ...}: {
      users.users.${userName}.openssh.authorizedKeys.keys = publicKeys.${keyList};
    };
  };
}
