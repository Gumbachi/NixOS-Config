{ inputs, pkgs, lib, ... }: {

  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true; 
    # dataDir = "/home/jared/Minecraft";
 
    servers = {

      vanilla-server = {
        enable = true;
        package = pkgs.vanillaServers.vanilla-1_21_1;
        openFirewall = true;
 
        serverProperties = {
          server-port = 42999;
          difficulty = 3;
          gamemode = 1;
          max-players = 5;
          motd = "NixOS 42999";
        };

        whitelist = {/* */};
  
      };
      

      # modded-server = {
      #   enable = true;
      #   package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.16.5"; };
      #
      #   serverProperties = {
      #     server-port = 43001;
      #     difficulty = 3;
      #     gamemode = 1;
      #     max-players = 5;
      #     motd = "Prominence Burn!";
      #   };
      #
      #   enableReload = true;
      #
      #   whitelist = {/* */};
      #
      #   # files = {
      #   #   "howdy.txt" = "/home/jared/Downloads/howdy.txt";
      #   #     # = "/home/jared/Downloads/Prominence/overrides/mods";
      #   # };
      #     # config = "/home/jared/Downloads/Prominence/overrides/config";
      #     # defaultconfig = "/home/jared/Downloads/Prominence/overrides/defaultconfig"; 
      #     # resourcepacks = "/home/jared/Downloads/Prominence/overrides/resourcepacks";
      #     # shaderpacks = "/home/jared/Downloads/Prominence/overrides/shaderpacks";
      #
      # };
    };
  };
}
