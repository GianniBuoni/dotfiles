{
  flake.aspects.rofi.homeManager = {pkgs, ...}: let
    screenshot = pkgs.writeShellScriptBin "screenshot" ''
      chosen=$(printf "Clipboard\nWindow\nMonitor\nRegion" | rofi -dmenu -p "Screenshot " -theme-str "listview {lines:4;}")

      case "$chosen" in
        "Clipboard") hyprshot -m output --clipboard-only ;;
        "Window") hyprshot -m window ;;
        "Monitor") hyprshot -m output ;;
        "Region") hyprshot -m region ;;
      esac
    '';
  in {
    home.packages = [screenshot pkgs.hyprshot];
  };
}
