{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qmk
    qmk_hid
  ];
  hardware.keyboard.qmk.enable = true;
}
