# Nix OS!

This is my current configuration for Nix OS for my machines.

- [ ] Add Screenshots

## Flake

Flake is setup such that System and User specific variables will determine which files get imported into the system.

These variables are defined in an untracked local file in the `/env` directory. To work around some of the rules around building Nix and Home-Manager systems within a git repo, the `/env` has to be staged and unstaged before and after building respectively:

```
git add . -Nf && sudo nixos-rebuild switch --flake .
```

This command is abbreviated as `:nn` in Espanso.

Then to commit:

```
git reset && git add . && git commit -m "..."
```

Abbreviated as `:gc` in Espanso.

## Home Manager

Home manager is setup as it's own separate module for potential use with work Mac.
Also, it's separated from the system in order to not pollute my system generations. It's a little faster to iterate.

```
git add . -Nf && home-manager switch --flake .
```

Abbreviated as `:nh` in Espanso.

## env Directory

If you look at `flake.nix` you will notice a few files that it needs to build the system.

Create a directory named `env` with this file structure:

```
.
├── hostName                        # Name this directory after the variable set in .env.local.nix
│   ├── default.nix
│   └── hardware-configuration.nix
├── userName.nix                    # Name this directory after the variable set in .env.local.nix
└── .env.local.nix                  # Define local variables here
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
