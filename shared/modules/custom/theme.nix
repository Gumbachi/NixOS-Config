{ config, lib, ... }:

with lib;

let 
  cfg = config.theme;
in
{

  options.theme = {
    monokai.enable = mkEnableOption "Enable the monokai theme with Stylix.";
    catppuccin-mocha.enable = mkEnableOption "Enable the catppuccin mocha theme with Stylix.";
  };

  config = mkMerge [
    (mkIf cfg.monokai.enabled {
      imports = [ ../themes/monokai.nix ];
    })

    (mkIf cfg.catppuccin-mocha.enabled {
      # Import stylix.nix file
    })

  ];


}
