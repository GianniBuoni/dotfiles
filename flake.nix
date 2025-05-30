{
  description = "Gianni Buoni's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

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

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # STYLING AND UI
    stylix.url = "github:danth/stylix";
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
      duck-muscles = nixpkgs.lib.nixosSystem (mkHost "duck-muscles" "laptop" "rose-pine");
      sleepy-gary = nixpkgs.lib.nixosSystem (mkHost "sleepy-gary" "homelab" "gruvbox-dark-medium");
    };
  };
}
