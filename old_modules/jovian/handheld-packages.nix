{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    chiaki4deck
  ];
}
