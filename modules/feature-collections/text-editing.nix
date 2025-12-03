{
  flake.aspects = {aspects, ...}: {
    textEditing = {
      includes = with aspects; [
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

      homeManager = {pkgs, ...}: {
        home.packages = with pkgs; [obsidian];
      };
    };
  };
}
