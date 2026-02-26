{
  flake.aspects.xdgAutostart.homeManager = {
    pkgs,
    inputs,
    ...
  }: {
    xdg.autostart = {
      enable = true;
      entries = [
        "${pkgs.obsidian}/share/applications/obsidian.desktop"
        "${pkgs.ghostty}/share/applications/com.mitchellh.ghostty.desktop"
        "${inputs.zen-browser.packages.x86_64-linux.default}/share/applications/zen-beta.desktop"
      ];
    };
  };
}
