{ ... }: {

  xdg.desktopEntries = {

    # yazi = {
    #   name = "Yazi";
    #   genericName = "File Explorer";
    #   exec = "yazi";
    #   terminal = true;
    #   mimeType = ["inode/directory"];
    #   icon = "system-file-manager";
    # };

    vlc = {
      name = "VLC";
      genericName = "Media Player";
      exec = "env -u DISPLAY vlc";
      icon = "vlc";
    };

    immich = {
      name = "Immich";
      genericName = "Photo Manager";
      exec = "xdg-open https://photos.gumbachi.com";
      icon = "immich";
    };



  };

} 
