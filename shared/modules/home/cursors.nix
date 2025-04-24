{ pkgs, ... }: {

  home.file.".local/share/icons/Bibata-Modern-Ice/".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice/";
  home.file.".local/share/icons/catppuccin-mocha-mauve-cursors/".source = "${pkgs.catppuccin-cursors.mochaMauve}/share/icons/catppuccin-mocha-mauve-cursors/";
  home.file.".local/share/icons/catppuccin-mocha-dark-cursors/".source = "${pkgs.catppuccin-cursors.mochaDark}/share/icons/catppuccin-mocha-dark-cursors/";
  home.file.".local/share/icons/catppuccin-mocha-light-cursors/".source = "${pkgs.catppuccin-cursors.mochaLight}/share/icons/catppuccin-mocha-light-cursors/";

  # stylix.cursor = {
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Ice";
  #   size = 24;
  # };

  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors.mochaLight;
    name = "catppuccin-mocha-light-cursors";
    size = 24;
    hyprcursor.enable = true;
    gtk.enable = true;
  };
  
}
