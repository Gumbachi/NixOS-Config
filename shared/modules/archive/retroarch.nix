{ pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    
    (retroarch.withCores (cores: with cores; [
      melonds
      mgba
      citra
    ]))

  ];
}
