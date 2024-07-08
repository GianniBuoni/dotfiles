# Nix OS!

This is my current configuration for Nix OS for my machines.

![Hyprland](/themes/gruvbox-dark-medium/screenshots/2024-07-04-202851_hyprshot.png)
_Hyprland with terminal widows open._<br><br>

![Neovim](/themes/gruvbox-dark-medium/screenshots/2024-07-04-202316_hyprshot.png)
_Alpha greeter for Neovim._<br><br>

![Rofi](/themes/gruvbox-dark-medium/screenshots/2024-07-04-203352_hyprshot.png)
_Rofi, featuring my custom Power Menu._<br><br>

![Wallpaper](/themes/gruvbox-dark-medium/screenshots/2024-07-04-202945_hyprshot.png)
_Waybar and Wallpaper taking center stage._<br><br>

## Flake

Flake is setup such that System and User specific variables are defined in an easy to reach file and get propagated to all the modules that depend on them.

These defined variables are stored in an untracked local file in the `/env` directory. See the [env Directory](#env-directory) section for more info.

To work around some of the rules that Nix imposes when building Nix and Home-Manager systems within a git repo, `/env` has to be force staged and them unstaged before and after building respectively.

Buidlding the system:

```
git add . -Nf && sudo nixos-rebuild switch --flake .
```

This command is abbreviated as `:nn` in Espanso.

Repo is then reset so as not to commit local files:

```
git reset && git add . && git commit -m "..."
```

Abbreviated as `:gc` in Espanso.

## Home Manager

Home manager is setup as it's own separate module.

```
git add . -Nf && home-manager switch --flake .
```

Abbreviated as `:nh` in Espanso.

## env Directory

`flake.nix` depends on imports and a couple other files from this directory to build the system.

`env` should look like this:

```
env
├── .env.local.nix                  # Define local variables here
├── hostName                        # Name this directory after the variable set in .env.local.nix
│   ├── default.nix
│   └── hardware-configuration.nix
└── userName.nix                    # Name this file after the variable set in .env.local.nix
```

Here is a basic template for the `.env.local.nix` file:

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

Also, both `/hostName/default.nix` and `userName.nix` files are just lists of imported modules.

## Programs

- Window Manager - [Hyprland](https://hyprland.org/)
- Terminal Emulator - [Kitty](https://sw.kovidgoyal.net/kitty/)
- Editor - [Neovim](https://neovim.io/)
- File Manager - [Yazi](https://yazi-rs.github.io/)
- Bar - [Waybar](https://github.com/Alexays/Waybar)
- Launcher & Power Menu - [Rofi](https://davatorium.github.io/rofi/)

## Useful Resources

- [My Nix OS](https://mynixos.com/)
- [Vimjoyer's Github](https://github.com/vimjoyer)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
