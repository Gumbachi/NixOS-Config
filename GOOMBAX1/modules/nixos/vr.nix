{ pkgs, ... }: {

  # Temp fix for beatsabermodmanager
  # nixpkgs.config.permittedInsecurePackages = [
  #   "dotnet-runtime-wrapped-7.0.20"
  #   "dotnet-runtime-7.0.20"
  #   "dotnet-core-combined"
  #   "dotnet-sdk-7.0.410"
  #   "dotnet-sdk-6.0.428"
  #   "dotnet-sdk-wrapped-7.0.410"
  #   "dotnet-sdk-wrapped-6.0.428"
  #   "dotnet-wrapped-combined"
  #   "dotnet-combined"
  # ];

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    # wlx-overlay-s 
    # beatsabermodmanager
  ];


}
