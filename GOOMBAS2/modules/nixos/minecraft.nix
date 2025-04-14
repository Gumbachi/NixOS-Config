{
  inputs,
  pkgs,
  ...
}: {
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
}
