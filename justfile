build-with-update: update build

build: write
  just pre-build
  sudo nixos-rebuild switch --flake .
  just post-build

update:
  sudo nix flake update

write:
  git add .
  nix run .#write-flake

check: write
  nix flake check --impure
