{ ... }: {

  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = /home/jared/Minecraft;
  };
}
