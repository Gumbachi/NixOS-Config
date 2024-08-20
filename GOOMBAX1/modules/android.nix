{ pkgs, ... }:

{

  # ADB / Device Pairing
  programs.adb.enable = true;
  users.users.jared = {
    extraGroups = [ "adbusers" "kvm" ];
    packages = with pkgs; [ 
      androidStudioPackages.canary
    ];
  };

}
