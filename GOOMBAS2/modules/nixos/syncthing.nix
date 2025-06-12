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
      folders."${storage}/Sync/Notes" = {
        label = "Notes";
        id = "notes";
        devices = [ "pixel" "GOOMBAX1" "Go7" ];
      };

      # General Shared Files
      folders."${storage}/Sync/Shared" = {
        label = "Shared Files";
        id = "shared";
        devices = [ "pixel" "GOOMBAX1" "Go7" ];
      };

      # Torrents
      folders."${storage}/Sync/Torrents" = {
        label = "Torrents";
        id = "torrents";
        devices = [ "GOOMBAX1" ];
      };

      # Books
      folders."${storage}/Media/Books" = {
        label = "Books";
        id = "books";
        devices = [ "Go7" ];
      };

      # Phone
      devices.pixel = {
        id = "RZWUQVJ-F3ETA27-2WNE7IF-Q5RIKRC-TU3BPKJ-V7RAX2F-IJYCEM2-PTB2XAY";
        autoAcceptFolders = false;
      };
      
      # Main Desktop
      devices.GOOMBAX1 = {
        id = "A3EODPJ-UEDWGN5-ULBOGU3-YK2Q6IK-RLURJQV-5KGCCQ4-3IZPKPS-NAAPLQV";
        autoAcceptFolders = false;
      };
      
      # E-Reader
      devices.Go7 = {
        id = "GKNIIKZ-6P7TNMQ-X4FDQPI-75UH404-J664KC2-MVU3SVQ-BFYQL5V-4WC4WAF";
        autoAcceptFolders = false;
      };

    };

  };

}
