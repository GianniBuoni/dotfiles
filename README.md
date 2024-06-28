## Hyprland To Do:

- [ ] Configure hyprshot

## Misc Chores:

- [ ] Write Template `env.local.nix` file

---

# Nix OS!

This is my current configuration for Nix OS for my machines.

## Flake

Flake is setup such that System and User specific variables will determine which files get imported into the system.

These variables are defined in an untracked local file called `env.local.nix`. To work around some of the rules around building Nix and Home-Manager systems within a git repo, the `env.local.nix` file has to be staged and unstaged before and after building respectively:

```
git add . -Nf && sudo nixos-rebuild switch --flake .
```

This command is abbreviated as `:nn` in Espanso.

Then to commit:

```
git reset && git add . && git commit -m "..."
```

## Home Manager

Home manager is setup as it's own separate module for potential use with work Mac.
Also, it's separated from the system in order to not pollute my system generations. It's a little faster to iterate.

```
git add . -Nf && home-manager switch --flake .
```

This command is abbreviated as `:nh` in Espanso.

## Programs

- Window Manager - [Hyprland](https://hyprland.org/)
- Terminal Emulator - [Alacritty](https://alacritty.org/)
- Editor - [Neovim](https://neovim.io/)
- File Manager - [Yazi](https://yazi-rs.github.io/)
- Bar - [Waybar](https://github.com/Alexays/Waybar)
- Launcher & Power Menu - [Rofi](https://davatorium.github.io/rofi/)

## Useful Resources

- [My Nix OS](https://mynixos.com/)
- [Vimjoyer's Github](https://github.com/vimjoyer)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
