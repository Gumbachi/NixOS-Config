{
  description = "NixOS Config";
 
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # "github:nixos/nixpkgs/585f76290ed66a3fdc5aae0933b73f9fd3dca7e3"; #
    ags.url = "github:aylur/ags/v1";
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:ryand56/catppuccin-nix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland.url = "github:hyprwm/Hyprland";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    
    home-manager = {
      url = "github:nix-community/home-manager";
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
        # inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
        inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
        inputs.nixos-hardware.nixosModules.common-gpu-amd

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

        # NVF
        inputs.nvf.nixosModules.default

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
        inputs.nvf.nixosModules.default # Neovim
        inputs.catppuccin.nixosModules.catppuccin # Catppuccin

        # Hardware Support
        inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
        inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
        inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
          
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
