# builds nixos configuration and updates all inputs
build-with-update: update build

# builds nixos configuration for current host
build: add
  sudo nixos-rebuild switch --impure --flake .

USER := jonnn
# builds nixos configuration for remote host
remote hostname: add
  nixos-rebuild switch \
    --flake .#{{hostname}} \
    --target-host {{USER}}@{{hostname}} \
    --impure \
    --ask-sudo-password

# updates all flake inputs
update:
  nix flake update

# stages all files to git
add:
  git add .

# runs a flake.nix generation
write: add
  nix run .#write-flake

# runs a flake check for all outputs
check: write
  nix flake check --impure

# function to make temporary directory
TEMP := shell('mktemp -d')
# location of age key on origin host
ORIGIN_AGE_KEY := "~/.config/sops/age/keys.txt"
# parent directory of target key
TARGET_AGE_DIR := TEMP + "/var/lib/sops-nix"
# location where sops-nix expects an age key to be
TARGET_AGE_KEY := TARGET_AGE_DIR + "/key.txt"

# install script assumes the target host is using a nixos installer and build host has sops nix running via nixos or home manager
install hostname ip source:
    install -d {{TARGET_AGE_DIR}}
    cp {{ORIGIN_AGE_KEY}} {{TARGET_AGE_KEY}}

    nix run github:nix-community/nixos-anywhere -- \
        --extra-files "{{TEMP}}" \
        --flake {{source}}#{{hostname}} \
        nixos@{{ip}}
