{ inputs, pkgs, ... }: {

  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  # Sky Factory 4 Minecraft Server
  systemd.services.sky-factory-4 = {
    enable = false;
    wantedBy = [ "multi-user.target" ];
    description = "Minecraft Server";
    serviceConfig = {
        Type = "simple";
        # Restart = "always";
        RestartSec = "60";
        Environment = "JAVA_HOME=${pkgs.jdk8}";
        WorkingDirectory = "/home/jared/A/Minecraft/SkyFactory-4_Server_4_2_4";
        ExecStart = "/home/jared/A/Minecraft/SkyFactory-4_Server_4_2_4/start.sh";
    };
  };

}
