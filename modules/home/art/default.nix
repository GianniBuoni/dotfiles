{pkgs, ...}: {
  home.packages = with pkgs; [
    krita
    aseprite
    ldtk
  ];
}
