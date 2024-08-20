{pkgs, ...}: let
  werk = pkgs.writeShellScriptBin "werk" ''
    tmux split-window -h -p 30 &&
    tmux split-window -v &&
    tmux select-pane -t 1 &&
    nvim
  '';
in {
  home.packages = [
    werk
  ];
}
