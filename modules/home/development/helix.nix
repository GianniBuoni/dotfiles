{lib, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "dracula";
      editor = {
        cursorline = true;
        cursor-shape.insert = "bar";
        indent-guides = {
          render = true;
          character = "┆"; # Some characters that work well: "▏", "┆", "┊", "⸽"
          skip-levels = 1;
        };
        soft-wrap.enable = true;
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {command = "alejandra";};
          auto-format = true;
        }
        {
          name = "markdown";
          formatter = {
            command = "prettier";
            args = ["--parser" "markdown"];
          };
          auto-format = true;
        }
      ];
    };
  };
}
