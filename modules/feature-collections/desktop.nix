{
  flake.aspects = {aspects, ...}: {
    desktop.includes = with aspects; [
      clipboard
      emojiPicker
      fuzzel
      hyprland
      waybar
      systemManagement # homeManager import
    ];
  };
}
