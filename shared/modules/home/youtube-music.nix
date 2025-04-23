{ pkgs, config, lib, ... }:
let
  cfg = config.programs.youtube-music;
  jsonFormat = pkgs.formats.json { };
in
{

  options.programs.youtube-music = {
    enable = lib.mkEnableOption "YouTube Music desktop client";
    package = lib.mkPackageOption pkgs "youtube-music" { };
    settings = lib.mkOption {
      type = jsonFormat.type;
      default = { };
      description = ''
        Youtube Music config written to
        {file}`$XDG_CONFIG_HOME/YouTube Music/config.json`.
      '';
    };

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vesktop ];
    xdg.configFile."YouTube Music/config.json".source = jsonFormat.generate "youtube-music-settings" cfg.settings;
  };

}
