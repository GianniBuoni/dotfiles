{
  description = "Gianni Buoni's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/b79ce4c43f9117b2912e7dbc68ccae4539259dda";

    # SYSTEM AND HARDWARE MANAGEMENT
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # EXTRA SERVICES
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # STYLING AND UI
    ags.url = "github:Aylur/ags";

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    mkHost = hostName: formFactor: theme: {
      system = "x86_64-linux";
      specialArgs = import ./specialArgs.nix {inherit hostName formFactor theme inputs;};
      modules = [./modules];
    };
  in {
    nixosConfigurations = {
      baby-wizard = nixpkgs.lib.nixosSystem (mkHost "baby-wizard" "handheld" "gruvbox-dark-medium");
      duck-muscles = nixpkgs.lib.nixosSystem (mkHost "duck-muscles" "laptop" "dracula");
      sleepy-gary = nixpkgs.lib.nixosSystem (mkHost "sleepy-gary" "homelab" "gruvbox-dark-medium");
    };
  };
}
