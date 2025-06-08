{ ... }:
let
  storage = "/mnt/main";
in
{

  services.syncthing = {
    enable = true;
    user = "jared"; # makes the most sense to run as me
    openDefaultPorts = true;
    dataDir = "${storage}";
    configDir = "${storage}/Config/Syncthing";
    settings = {

      # Notes - Knowledge Base
      folders."${storage}/Documents/Notes" = {
        id = "main";
        devices = [ "pixel" ];
      };

      # Pixel 8 - Phone
      devices.pixel = {
        id = "A3EODPJ-UEDWGN5-ULBOGU3-YK2Q6IK-RLURJQV-5KGCCQ4-3IZPKPS-NAAPLQV";
        autoAcceptFolders = false;
      };

    };

  };

}
