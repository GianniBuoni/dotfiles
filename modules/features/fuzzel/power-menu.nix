{
  flake.aspects.fuzzel.homeManager = {pkgs, ...}: let
    power-menu = pkgs.writeShellScriptBin "power-menu" ''
      chosen=$(printf "󰐥 Shutdown\n󰜉 Restart\n󰗽 Log Off\n󰌾 Lock Screen" | fuzzel -d --lines=4 --width=40 --hide-prompt)

      case "$chosen" in
        "󰐥 Shutdown") poweroff ;;
        "󰜉 Restart") reboot ;;
        "󰗽 Log Off") hyprctl dispatch exit ;;
        "󰌾 Lock Screen") hyprlock ;;
        *) exit 1 ;;
      esac
    '';
  in {
    home.packages = [power-menu];
  };
}
