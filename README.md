# Nix OS!

This is my current NixOS configuration for my machines. In this flake, I maintain system and home-manager configurations for:

- My main development machine/laptop
- Three `k3s` nodes for my homelab
- Test machines for playing around with nix

## Flake parts & dendritic pattern

This flake was recently refactored using [flake-parts](https://flake.parts/) along with the guidelines and utilities provided by [dendritic nix](https://dendrix.oeiuwq.com/Dendritic.html).

I'm aiming to create a flake structure that leverages the programmatic tools and functions nix the language provides, as well as make maintaining multiple hosts and systems manageable, modular, and reproducible.

## Sops nix

Configuration relies on secrets management via [sops-nix](https://github.com/Mic92/sops-nix).

However, there are some "soft" secrets used in the configuration. These are for options that don't have file options that I'm OK with going into the nix store. Because of this, the evaluation and building of the flake requires the `--impure` flag.

Later down the line I may explore other solutions that let me maintain pure evaluations and safely inject these "soft" secrets into the system. But for now, the current solution suffices.

## Programs

- Window Manager - [hyprland](https://hyprland.org/)
- Terminal Emulator - [ghostty](https://ghostty.org/)
- Editor - [helix](https://helix-editor.com/)
- File Manager - [yazi](https://yazi-rs.github.io/)
- Bar - [waybar](https://github.com/Alexays/Waybar)
- Menu - [fuzzel](https://codeberg.org/dnkl/fuzzel)

## Useful Resources

- [My Nix OS](https://mynixos.com/)
- [Vimjoyer's Github](https://github.com/vimjoyer)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
