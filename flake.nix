{
  description = "Gianni Buoni's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";

    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (import ./env/env.local.nix) systemSettings userSettings;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
  in {
    # Configuration for Linux hosts
    nixosConfigurations.${systemSettings.hostName} = nixpkgs.lib.nixosSystem {
      inherit (systemSettings) system;
      specialArgs = {
        inherit userSettings;
        inherit systemSettings;
        inherit (inputs) jovian;
      };
      modules = [
        ./modules
        inputs.stylix.nixosModules.stylix
      ];
    };

    # Configuration for standalone home-manager
    homeConfigurations.${userSettings.userName} = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit userSettings;
        inherit systemSettings;
      };
      modules = [
        ./modules/home
        inputs.stylix.homeManagerModules.stylix
        inputs.nixvim.homeManagerModules.nixvim
        inputs.ags.homeManagerModules.default
      ];
    };
  };
}
