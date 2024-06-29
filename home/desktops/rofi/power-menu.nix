{pkgs, ...}: let
  power-menu = pkgs.writeShellScriptBin "power-menu" ''
    chosen=$(printf "󰌾 Lock Screen\n󰏤 Suspend\n󰗽 Log Off\n󰜉 Restart\n󰐥 Shutdown" | rofi -dmenu -p "Power Menu " -theme-str "listview {lines:5;}")

    case "$chosen" in
      "󰌾 Lock Screen") hyprlock ;;
      "󰏤 Suspend") systemctl suspend ;;
      "󰗽 Log Off") hyprctl dispatch exit ;;
      "󰜉 Restart") reboot ;;
      "󰐥 Shutdown") poweroff ;;
      *) exit 1 ;;
    esac
  '';
in {
  home.packages = [power-menu];
}
