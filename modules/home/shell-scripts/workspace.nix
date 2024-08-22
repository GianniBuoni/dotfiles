{pkgs, ...}: let
  werk = pkgs.writeShellScriptBin "werk" ''
    tmux split-window -h -p 25 &&
    tmux split-window -v &&
    tmux select-pane -t 1 &&
    nvim
  '';
  ddo = pkgs.writeShellScriptBin "ddo" ''
    tmux new-session -A -c ~/dotfiles -s dotfiles
  '';
  rro = pkgs.writeShellScriptBin "rro" ''
    repo=$(${pkgs.zoxide}/bin/zoxide query $1)
    tmux new-session -A -c $repo -s $1
  '';
in {
  home.packages = [
    ddo
    werk
    rro
  ];
}
