{ user, ... }:{

  home.username = user;
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
