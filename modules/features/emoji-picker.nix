{
  flake.aspects.emojiPicker.homeManager = {pkgs, ...}: {
    home.packages = with pkgs; [bemoji];
    home.sessionVariables.BEMOJI_PICKER_CMD = "fuzzel -d";
  };
}
