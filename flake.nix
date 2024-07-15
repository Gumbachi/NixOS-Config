{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, catppuccin, ... }: {
    
    nixosConfigurations = {
      
      ######################################
      #########      GOOMBAX1      #########
      ######################################

      GOOMBAX1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./GOOMBAX1/configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hmbak";
            home-manager.users.jared = {
              imports = [
                ./GOOMBAX1/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
          
        ];
      };

      ######################################
      ##########      XPS15       ##########
      ######################################

      XPS15 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./XPS15/configuration.nix

          catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
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