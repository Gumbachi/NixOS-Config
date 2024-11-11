{
  description = "NixOS Config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ags.url = "github:Aylur/ags";
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:ryand56/catppuccin-nix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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

    # nvim.url = "path:/home/jared/NixOS-Config/shared/nvim";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    umu = {
      url = "git+https://github.com/Open-Wine-Components/umu-launcher/?dir=packaging\/nix&submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    
    # Host Name = <GOOMBA><X/S/L><Number>
    # GOOMBA = Name
    # X/S/L = Desktop, Server, Laptop
    # Number = ID Number I Guess
    
    nixosConfigurations.GOOMBAX1 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        ./GOOMBAX1/configuration.nix # Main Config
        
        # Hardware Support
        inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
        inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate

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
        
        # Catppuccin
        inputs.catppuccin.nixosModules.catppuccin

        # Nixvim
        inputs.nixvim.nixosModules.nixvim
          
      ];

    };

    nixosConfigurations.GOOMBAS2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./GOOMBAS2/configuration.nix # Main Config
        inputs.nixvim.nixosModules.nixvim # Nixvim
          
        # Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hmbak";
          };

          home-manager.users.jared.imports = [
            ./GOOMBAS2/home.nix
          ];
        }

      ];
    };

    nixosConfigurations.GOOMBAL1 = nixpkgs.lib.nixosSystem {
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

    nixosConfigurations.GOOMBAS1 = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./GOOMBAS1/configuration.nix
        inputs.nixos-hardware.nixosModules.raspberry-pi-4
        inputs.nixvim.nixosModules.nixvim
      ];      
    };

  };
}
