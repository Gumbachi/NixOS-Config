{ inputs, config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
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
    home-manager.sharedModules = [
      { 
        programs.rofi.enable = cfg.rofi.enable;
        programs.fuzzel.enable = cfg.fuzzel.enable;
        programs.anyrun.enable = cfg.anyrun.enable;
      }

      (mkIf cfg.walker.enable {
        nix.settings = {
          substituters = [ 
            "https://walker.cachix.org" 
            "https://walker-git.cachix.org"
          ];
          trusted-public-keys = [
            "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
            "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
          ];
        };
        imports = [ inputs.walker.homeManagerModules.default ];
        programs.walker.enable = cfg.walker.enable;
      })

    ];
  };
 
}
