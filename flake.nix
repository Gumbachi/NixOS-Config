{
  description = "Gumbachi NixOS Config";
  inputs = {
    
    # Default
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # System
    stylix.url = "github:danth/stylix";

    agenix.url = "github:ryantm/agenix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # Applications
    overway.url = "github:Gumbachi/overway/gtk4-rewrite";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    niri.url = "github:sodiboo/niri-flake";

    nvf.url = "github:notashelf/nvf";

    walker.url = "github:abenz1267/walker";

    caelestia.url = "github:caelestia-dots/shell";
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs: {
    # Host Name = <GOOMBA><X/S/L><Number>
    # GOOMBA = Name
    # X/S = Desktop/Laptop, Server
    # Number = ID

    nixosConfigurations.GOOMBAX1 = let 
      user = "jared";
      configPath = "/home/${user}/nixos-config";
    in nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
        inherit inputs;
        inherit user;
      };
      modules = [
        ./GOOMBAX1/configuration.nix # Main Config

        # Home Manager
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hmbak";
            extraSpecialArgs = { 
              inherit inputs; 
              inherit configPath;
            };
          };
          home-manager.users.${user}.imports = [ ./GOOMBAX1/home.nix ];
        }

        # Overlays
        { nixpkgs.overlays = [ 
          inputs.niri.overlays.niri 
        ];}

        # Hardware Support
        inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate

        # Third Party
        inputs.stylix.nixosModules.stylix
        inputs.nvf.nixosModules.default
        inputs.nur.modules.nixos.default
        inputs.agenix.nixosModules.default
        inputs.niri.nixosModules.niri

      ];
    };

    nixosConfigurations.GOOMBAS2 = let 
      user = "jared";
      configPath = "/home/${user}/nixos-config";
    in nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
        inherit inputs;
        inherit user;
      };
      modules = [
        ./GOOMBAS2/configuration.nix # Main Config

        # Home Manager
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hmbak";
            extraSpecialArgs = { 
              inherit inputs;
              inherit user; 
              inherit configPath;
            };
          };
          home-manager.users.${user}.imports = [ ./GOOMBAS2/home.nix ];
        }

        # Hardware Support
        inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
        inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate

        # Third Party
        inputs.nvf.nixosModules.default # Neovim
        inputs.stylix.nixosModules.stylix
        inputs.agenix.nixosModules.default

      ];
    };

    nixosConfigurations.GOOMBAX2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Main Config
        ./GOOMBAX2/configuration.nix

        # Hardware Config
        inputs.nixos-hardware.nixosModules.dell-xps-15-9560

        # Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hmbak";
          };
          home-manager.users.jared.imports = [ ./GOOMBAX2/home.nix ];
        }

        # Third Party Modules
        inputs.stylix.nixosModules.stylix
        inputs.nvf.nixosModules.default
      ];
    };

  };
}
