{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    helix
    starship
    yazi
    btop
  ];

}
