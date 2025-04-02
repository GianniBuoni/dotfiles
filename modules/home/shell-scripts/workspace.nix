{pkgs, ...}: let
  werk = pkgs.writeShellScriptBin "werk" ''
    tmux new-window &&
    tmux select-window -t 1 &&
    nvim
  '';
  ddo = pkgs.writeShellScriptBin "ddo" ''
    tmux new-session -A -c ~/dotfiles -s dotfiles
  '';
in {
  home.packages = [
    ddo
    werk
  ];
}
