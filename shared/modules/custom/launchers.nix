{ inputs, config, lib, ... }:
let
  inherit (lib) mkEnableOption;
  module = "launchers";
  cfg = config.${module};
in {

  options.${module} = {
    rofi.enable = mkEnableOption "Enable rofi. Make sure to set rofi package in config.";
    fuzzel.enable = mkEnableOption "Enable fuzzel app launcher.";
    anyrun.enable = mkEnableOption "Enable anyrun launcher.";
    walker.enable = mkEnableOption "Enable walker launcher.";
  };

  config = {
    home-manager.sharedModules = [{

      imports = [ inputs.walker.homeManagerModules.default ];

      programs.rofi.enable = cfg.rofi.enable;
      programs.fuzzel.enable = cfg.fuzzel.enable;
      programs.walker.enable = cfg.walker.enable;
      programs.anyrun.enable = cfg.anyrun.enable;

    }];
  };
 
}
