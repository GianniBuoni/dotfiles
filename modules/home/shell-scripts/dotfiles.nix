{pkgs, ...}: let
  sn = "dotfiles";
  dds = pkgs.writeShellScriptBin "dds" ''
    cd ~/${sn}
    tmux new-session -d -s "${sn}"
    tmux rename-window "nvim"
    tmux split-window -h -b -l 75%
    tmux send-keys -t "${sn}:nvim" "nvim" Enter

    tmux new-window -a -t "${sn}" -n "env"
    tmux send-keys -t "env" "cd ~/${sn}-env" Enter
    tmux send-keys -t "env" "lazygit" Enter
  '';
  ddo = pkgs.writeShellScriptBin "ddo" ''
    tmux attach -t "${sn}:nvim"
  '';
in {
  home.packages = [
    dds
    ddo
  ];
}
