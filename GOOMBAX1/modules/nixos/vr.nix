{ pkgs, ... }: {

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = [
    pkgs.wlx-overlay-s 
  ];

}
