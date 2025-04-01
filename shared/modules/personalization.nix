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
        type = lib.types.path;
        default = ~/Pictures;
      };
      randomizeOnLaunch = lib.mkEnableOption "Use a random wallpaper when waypaper is launched";
      rotateWallpaper = {
        enable = lib.mkEnableOption "Rotate the wallpaper every day";
        interval = lib.mkOption {
          type = lib.types.integer;
          description = "The interval in which to rotate the wallpaper in minutes.";
          default = 30; 
        };
      };
    };
  };

  config = lib.mkIf cfg.waypaper.enable {
    environment.systemPackages = [ pkgs.waypaper pkgs.hyprpaper ];
    systemd.user.services.waypaperLaunch = {
      enable = true;
      description = "Run waypaper once on startup.";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      script = ''
        waypaper 
        --folder ${ cfg.waypaper.wallpaperDir } 
        ${ if config.waypaper.randomizeOnLaunch then "--random" else "--restore" }
      '';
    };
    systemd.user.services.waypaperRotate = {
      enable = lib.mkDefault cfg.waypaper.rotateWallpaper.enable;
      description = "Rotate wallpaper on a fixed interval.";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      script = ''waypaper --folder ${ cfg.waypaper.wallpaperDir } --random'';
      startAt = "*:0/${ cfg.waypaper.rotateWallpaper.interval }";
    };
  };
}
