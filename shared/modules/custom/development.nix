{ pkgs, config, lib, ... }:

with lib;

let 
  cfg = config.development;
in
{
  
  options.development = {
    android.enable = mkEnableOption "Enable the required tools for Android development."; 
    devenv.enable = mkEnableOption "Enable devenv for declarative, reproducible dev environments.";
  };

  config = mkMerge [

    (mkIf cfg.android.enable {
      programs.adb.enable = true;
      users.users.jared.extraGroups = [ "adbusers" "kvm" ];
      environment.systemPackages = [ pkgs.android-studio ];
    })

    (mkIf cfg.devenv.enable {
      environment.systemPackages = [ pkgs.devenv ];
    })

  ];


}
