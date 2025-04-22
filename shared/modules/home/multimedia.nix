{ pkgs, config, lib, ... }: 

with lib;

let
  cfg = config.multimedia;
  json = pkgs.formats.json { };
in {
  options.multimedia = {
    vesktop = {
      enable = mkEnableOption "Add Vesktop to packages.";
      extraConfig = mkOption {
        inherit (json) type;
        description = "Extra config / default config states for vesktop settings.json";
        default = { };
      };
    };
    youtube-music = {
      enable = mkEnableOption "Add th-ch Youtube Music to packages.";
      extraConfig = mkOption {
        inherit (json) type;
        description = "Extra config / default config states for yt-music config.json";
        default = { };
      };
    };
  };

  config =
    lib.mkMerge [
      (mkIf cfg.vesktop.enable {
        home.packages = [ pkgs.vesktop ];
        # xdg.configFile."vesktop/settings/settings.json".text = cfg.vesktop.extraConfig;
      })

      (mkIf cfg.youtube-music.enable {
        home.packages = [ pkgs.youtube-music ];
        # xdg.configFile."YouTube Music/config.json".text = cfg.youtube-music.extraConfig;
      })
    ];
}
