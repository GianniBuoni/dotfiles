build-with-update:
  just update
  just build

build:
  just pre-build
  sudo nixos-rebuild switch --flake .
  just post-build

pre-build:
  git add . -Nf

post-build:
  git reset

update:
  sudo nix flake update
