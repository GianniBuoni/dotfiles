{
  config,
  lib,
  userSettings,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi.theme = {
    "*" = {
      border = 0;
      spacing = 0;
      padding = 0;
      margin = 0;
    };

    "window" = {
      location = mkLiteral "center";
      width = mkLiteral "45%";
      border-radius = mkLiteral "7px";
      border = mkLiteral "1px";
      border-color = mkLiteral "#${userSettings.palette.base0D}";
      padding = mkLiteral "10px";
    };

    "inputbar" = {
      children = map mkLiteral ["prompt" "entry"];
      padding = mkLiteral "5px";
    };

    "listview" = {
      lines = 8;
    };

    "element" = {
      padding = mkLiteral "5px";
    };

    "element alternate.active" = lib.mkForce {
      background-color = mkLiteral "@background";
      text-color = mkLiteral "@normal-text";
    };
    "element alternate.normal" = lib.mkForce {
      background-color = mkLiteral "@background";
      text-color = mkLiteral "@normal-text";
    };
    "element-icon" = {
      margin = mkLiteral "0 5px 0 0";
    };

    "element selected.normal" = lib.mkForce {
      background-color = mkLiteral "#${userSettings.palette.base0D}";
      text-color = mkLiteral "@background";
    };
  };
}
