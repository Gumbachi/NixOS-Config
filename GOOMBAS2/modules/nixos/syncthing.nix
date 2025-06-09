{ config, lib, ... }:
let
  storage = "/mnt/main";
in
{
  # Automatically open port if syncthing is enabled
  networking.firewall.allowedTCPPorts = lib.mkIf config.services.syncthing.enable [ 8384 ];

  services.syncthing = {
    enable = true;
    user = "jared"; # makes the most sense to run as me
    group = "users";
    openDefaultPorts = true;
    dataDir = "${storage}";
    configDir = "${storage}/Config/Syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    guiAddress = "0.0.0.0:8384";
    settings = {

      # Notes - Knowledge Base
      folders."${storage}/Documents/Notes" = {
        label = "Notes";
        id = "notes";
        devices = [ "pixel" "GOOMBAX1" ];
      };

      # 
      folders."${storage}/Documents/Shared" = {
        label = "Shared Files";
        id = "shared";
        devices = [ "pixel" "GOOMBAX1" ];
      };

      # Pixel 8 - Phone
      devices.pixel = {
        id = "RZWUQVJ-F3ETA27-2WNE7IF-Q5RIKRC-TU3BPKJ-V7RAX2F-IJYCEM2-PTB2XAY";
        autoAcceptFolders = false;
      };

      devices.GOOMBAX1 = {
        id = "A3EODPJ-UEDWGN5-ULBOGU3-YK2Q6IK-RLURJQV-5KGCCQ4-3IZPKPS-NAAPLQV";
        autoAcceptFolders = false;
      };

    };

  };

}
