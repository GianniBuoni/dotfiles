{
  description = "Gianni Buoni's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

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
    inherit (import ./env/env.local.nix) systemSettings userSettings;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
  in {
    #Linux Host
    nixosConfigurations.${systemSettings.hostName} = nixpkgs.lib.nixosSystem {
      inherit (systemSettings) system;
      specialArgs = {inherit systemSettings userSettings inputs;};
      modules = [./modules];
    };

    # Configuration for standalone home-manager
    homeConfigurations.${userSettings.userName} = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit systemSettings userSettings inputs;};
      modules = [./modules/home];
    };
  };
}
