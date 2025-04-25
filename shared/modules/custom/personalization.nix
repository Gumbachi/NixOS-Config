{ config, lib, pkgs, ... }: 
let
  cfg = config.wallpaper;
in
{  
  options = {
    wallpaper.waypaper = {
      enable = lib.mkEnableOption "Enable waypaper for wallpaper management";
      wallpaperDir = lib.mkOption {
        description = "Location to search for wallpapers";
        type = lib.types.string;
        default = "~/Pictures";
      };
      randomizeOnLaunch = lib.mkEnableOption "Use a random wallpaper when waypaper is launched";
      rotateWallpaper = {
        enable = lib.mkEnableOption "Rotate the wallpaper every day";
        interval = lib.mkOption {
          type = lib.types.int;
          description = "The interval in which to rotate the wallpaper in seconds.";
          default = 1800; 
        };
      };
    };
  };

  config = lib.mkIf cfg.waypaper.enable {
    environment.systemPackages = [ pkgs.waypaper pkgs.hyprpaper ];

    systemd.user.services.waypaperLaunch = {
      enable = true;
      path = with pkgs; [ bash ];
      description = "Run waypaper once on startup.";
      wantedBy = [ "default.target" ];
      script = ''bash -c 'PATH=$PATH exec waypaper --random' '';
      # serviceConfig = {
      #   Type = "simple";
      #   # User = "jared";
      #   # Group = "users";
      #   ExecStart = "/home/jared/NixOS-Config/scripts/switchwallpaper.sh";
      # };
    };

    systemd.user.services.waypaperRotate = {
      enable = lib.mkDefault cfg.waypaper.rotateWallpaper.enable;
      description = "Rotate wallpaper on a fixed interval.";
      path = with pkgs; [ waypaper procps ];
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      script = ''waypaper --folder /home/jared/NixOS-Config/images/wallpapers --random'';
      # script = ''
      #   while true; do
      #     sleep ${ toString cfg.waypaper.rotateWallpaper.interval }
      #     waypaper --folder ${ cfg.waypaper.wallpaperDir } --random
      #   done
      # '';
      # startAt = "*:0/${ toString cfg.waypaper.rotateWallpaper.interval }";
      startAt = "*:0/1";
    };
  };
}
