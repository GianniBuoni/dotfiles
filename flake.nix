{
  description = "Gianni Buoni's NixOS Flake";

  inputs = {
    # Nix OS unstable branch selected as source for all packages
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # ----- HOME MANAGER ----- #
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ------ STYLIX ----- #
    stylix.url = "github:danth/stylix";

    # ----- NIX VIM ----- #
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ---- AGS WIDGETS ----- #
    ags.url = "github:Aylur/ags";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    stylix,
    ...
  } @ inputs: let
    inherit (import ./.env.local.nix) systemSettings userSettings;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
  in {
    # Configuration for system host
    nixosConfigurations.${systemSettings.hostName} = nixpkgs.lib.nixosSystem {
      inherit (systemSettings) system;
      specialArgs = {
        inherit userSettings;
        inherit systemSettings;
      };
      modules = [
        ./hosts
        stylix.nixosModules.stylix
      ];
    };

    # Configuration for standalone home-manager
    homeConfigurations.${userSettings.userName} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit userSettings;
        inherit systemSettings;
      };
      modules = [
        ./home
        stylix.homeManagerModules.stylix
        nixvim.homeManagerModules.nixvim
        inputs.ags.homeManagerModules.default
      ];
    };
  };
}
