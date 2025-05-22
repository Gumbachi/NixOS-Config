{ user, ... }:{

  home.username = user;
  home.homeDirectory = "/home/${user}";

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
