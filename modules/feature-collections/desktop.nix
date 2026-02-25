{
  flake.aspects = {aspects, ...}: {
    desktop.includes = with aspects; [
      clipboard
      emojiPicker
      fuzzel
      niri
      waybar
      systemManagement # homeManager import
    ];
  };
}
