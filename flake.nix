{
  description = "NixOS Config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ags.url = "github:Aylur/ags";
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    
    nixosConfigurations.GOOMBAX1 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [

        # Main Config
        ./GOOMBAX1/configuration.nix
          
        # Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hmbak";
          };

          home-manager.users.jared.imports = [
            ./GOOMBAX1/home.nix
            inputs.ags.homeManagerModules.default
            inputs.catppuccin.homeManagerModules.catppuccin
          ];
        }
        
        # Nixvim
        inputs.nixvim.nixosModules.nixvim

        # Catppuccin
        inputs.catppuccin.nixosModules.catppuccin

        # Stylix
        # stylix.nixosModules.stylix
          
      ];

    };

    nixosConfigurations.GOOMBAX2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # NixOS Config
        ./GOOMBAX2/configuration.nix

        home-manager.nixosModules.home-manager
        {

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hmbak";
          };

          home-manager.users.jared.imports = [
            ./GOOMBAX2/home.nix
            inputs.ags.homeManagerModules.default
          ];

        }
          
        # Stylix
        inputs.stylix.nixosModules.stylix

      ];

    };

  };
}
