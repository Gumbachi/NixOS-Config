{ inputs, pkgs, lib, config, ... }: {

  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  # Sky Factory 4 Minecraft Server
  systemd.services.sky-factory-4 = {
    enable = false;
    wantedBy = ["multi-user.target"];
    description = "Minecraft Server";
    serviceConfig = {
      Type = "simple";
      RestartSec = "60";
      Environment = "JAVA_HOME=${pkgs.jdk8}";
      WorkingDirectory = "/home/jared/B/Servers/Minecraft/SkyFactory-4_Server_4_2_4";
      ExecStart = "/home/jared/B/Servers/Minecraft/SkyFactory-4_Server_4_2_4/start.sh";
    };
  };

  # DawnCraft Minecraft Server
  systemd.services.dawncraft = {
    enable = false;
    wantedBy = ["multi-user.target"];
    description = "DawnCraft Minecraft Server";
    serviceConfig = {
      Type = "simple";
      RestartSec = "60";
      Environment = "JAVA_HOME=${pkgs.jdk}";
      WorkingDirectory = "/home/jared/B/Servers/Minecraft/DawnCraft";
      ExecStart = "/home/jared/B/Servers/Minecraft/DawnCraft/start.sh";
    };
  };

  networking.firewall.allowedTCPPorts = [ 43002 ];
}
