{
  flake.aspects.textEditing.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      helix
      # lsp
      alejandra
      lua-language-server
      marksman
      nil
      nodePackages.prettier
    ];

    environment.sessionVariables.EDITOR = "hx";
  };
}
