{pkgs, ...}: {
  # ----- STREAMING ----- #
  environment.systemPackages = with pkgs; [
    moonlight-qt
  ];
}
