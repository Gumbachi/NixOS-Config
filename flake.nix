{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, catppuccin, home-manager, ... }: {
    
    nixosConfigurations = {
      
      GOOMBAX1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          ./GOOMBAX1/configuration.nix

          catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jared = {
              imports = [
                ./GOOMBAX1/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
          
        ];
      };

      XPS15 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./XPS15/configuration.nix

          catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jared = {
              imports = [
                ./XPS15/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
          
        ];
      };

    };
  };
}