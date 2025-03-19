{ pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    # App
    retroarch

    # Cores
    libretro.melonds
    libretro.mgba
    libretro.citra


  ];
}
