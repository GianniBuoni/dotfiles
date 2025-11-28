{
  flake.aspects = {aspcets, ...}: {
    textEditing = {
      includes = with aspcets; [
        helix
      ];

      nixos = {pkgs, ...}: {
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
    };
  };
}
