{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    ags.url = "github:Aylur/ags";
    stylix.url = "github:danth/stylix";

    # hyprland = {
    #   type = "git";
    #   url = "https://github.com/hyprwm/Hyprland";
    #   submodules = true;
    # };

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, catppuccin, ags, stylix, ... }@inputs: {
    
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
                ags.homeManagerModules.default
              ];
            };
          }
          
        ];
      };

      ######################################
      #########     GOOMBAX2       ########
      ######################################

      GOOMBAX2 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = { inherit inputs; }; # this is the important part
        modules = [
          ./GOOMBAX2/configuration.nix

          stylix.nixosModules.stylix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hmbak";
            home-manager.users.jared = {

              imports = [
                ./GOOMBAX2/home.nix
              ];

            };
          }
          
        ];
      };

    };
  };
}
