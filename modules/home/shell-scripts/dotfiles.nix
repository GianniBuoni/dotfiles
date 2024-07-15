{pkgs, ...}: let
  sn = "dotfiles";
  dotfiles-session = pkgs.writeShellScriptBin "dotfiles-session" ''
    cd ~/${sn}
    tmux new-session -d -s "${sn}"
    tmux new-window -t "${sn}" -n "nvim"
    tmux send-keys -t "${sn}:nvim" "nvim" Enter
  '';
  dotfiles-open = pkgs.writeShellScriptBin "dotfiles-open" ''
    tmux attach -t "${sn}"
  '';
in {
  home.packages = [
    dotfiles-session
    dotfiles-open
  ];
}
