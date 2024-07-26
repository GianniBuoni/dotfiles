## To Do:

- [ ] Store local repo path as a system variable
- [ ] Write script for generating AGS types
- [ ] gitignore AGS types folder

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

The flake is setup such that System and User specific variables are defined in an easy to reach local file, which is hard linked as the `.env.local.nix` file. (_See the [env File](#env-file) section for more info._)

These variables then get propagated to all the modules that depend on them.

Nix has its own set of limitations when building in a git repo. To work around this, `.env.local.nix` has to be force staged and then unstaged before and after building respectively.

Building the system:

```
git add . -Nf && sudo nixos-rebuild switch --flake . && git reset
```

This command is abbreviated as `nn` in a custom shell script.<br><br>

## Home Manager

Home Manager is setup as it's own separate module. Like the System, it needs to stage and unstage `.env.local.nix`, too.

```
git add . -Nf && home-manager switch --flake . && git reset
```

Abbreviated as `nh` in a custom shell script.<br><br>

## env File

`flake.nix` depends on variables from this file to build the System and Home Manager.

Here is a basic template for the `env.local.nix` file:

```
{
  systemSettings = {
    system = "x86_64-linux";
    hostName = "hostName";
    formFactor = "laptop";
    # model = "laptop-model-name";
  };

  userSettings = {
    userName = "userName";
    name = "your-full-name";
    # email = "your-email";
    # gitEmail = "your-email-for-git";
    theme = "base-16-theme-name";
    palette = values-of-base-16-theme-name;
    font = "font-name";
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
