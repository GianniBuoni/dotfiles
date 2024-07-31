## To Do:

- [x] Write script for generating AGS types
- [x] gitignore AGS types folder
- [ ] Learn AGS
- [ ] Make AGS Menu

# Nix OS!

This is my current Nix OS configuration for my machines.

![Hyprland](/themes/gruvbox-dark-medium/screenshots/2024-07-04-202851_hyprshot.png)
_Hyprland with terminal windows open._<br><br>

![Neovim](/themes/gruvbox-dark-medium/screenshots/2024-07-04-202316_hyprshot.png)
_Alpha greeter for Neovim._<br><br>

![Rofi](/themes/gruvbox-dark-medium/screenshots/2024-07-04-203352_hyprshot.png)
_Rofi, featuring my custom Power Menu._<br><br>

![Wallpaper](/themes/gruvbox-dark-medium/screenshots/2024-07-04-202945_hyprshot.png)
_Waybar and Wallpaper taking center stage._<br><br>

## Flake

Hosts are defined via the `mkHost` function defined in the `outputs`'s let binding.

Special args are defined by an unanmed function defined in the gitigonred file `specialArgs.nix`.<br>
I've gitigonred `specialArgs.nix` since it contains some personal information&mdash;I might consider seeing if sops-nix is a good solution to this problem down the road.

In the meanwhile, see the [specialArgs](#specialArgs) section for a template.

Since nix is opiniated about building flakes from within a git repo, there are a few workarounds involved with building the system:

```
git add . -Nf && sudo nixos-rebuild switch --flake . && git reset
```

This command is abbreviated as `nn` in a custom shell script.<br><br>

## Home Manager

Home Manager is setup as system module. However, if you need to adapt the setup for the standalone version. One would also need to stage and unstage `specialArgs.nix`, too.

```
git add . -Nf && home-manager switch --flake . && git reset
```

Abbreviated as `nh` in a custom shell script.<br><br>

## specialArgs

`flake.nix` depends on variables from this file to build the System and Home Manager.

Here is a basic template for the `specialArgs.nix` file:

```nix
{
  hostName,
  formFactor,
  theme,
  inputs,
}: let
  name = "fist-name";
  lastName = "last-name";
  font = "font-name";
in {
  inherit inputs
  systemSettings = {inherit hostName formFactor};

  userSettings = {
    inherit name lastName theme font;
    userName = "userName";
    fullName = name + lastName;
    gitUser = "git-user-name";
    gitEmail = "your-email-for-git";
    inherit (import ./themes/${theme}) palette;
    nerdFont = font + " Nerd Font";
    cursor = "cursor-name";
    cursorPkg = "cursor-package-name";
  };
}
```

<br>

## Programs

- Window Manager - [Hyprland](https://hyprland.org/)
- Terminal Emulator - [Kitty](https://sw.kovidgoyal.net/kitty/)
- Editor - [Neovim](https://neovim.io/)
- File Manager - [Yazi](https://yazi-rs.github.io/)
- Bar - [Waybar](https://github.com/Alexays/Waybar)
- Launcher & Power Menu - [Rofi](https://davatorium.github.io/rofi/)
- Text Expansion - [Espanso](https://espanso.org/)<br><br>

## Useful Resources

- [My Nix OS](https://mynixos.com/)
- [Vimjoyer's Github](https://github.com/vimjoyer)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
