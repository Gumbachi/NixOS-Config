{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    
    nixosConfigurations = {
      
      GOOMBAX1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          ./GOOMBAX1/System/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jared = import ./GOOMBAX1/home.nix;
          }
          
        ];
      };

      XPS15 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          ./XPS15/System/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jared = import ./XPS15/home.nix;
          }
          
        ];
      };

    };
  };
}