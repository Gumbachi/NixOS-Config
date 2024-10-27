{ pkgs, ... }: {

  # Cursor Config
  # home.pointerCursor = {
  #   package = pkgs.catppuccin-cursors.mochaMauve;
  #   name = "catppuccin-mocha-mauve-cursors";
  #   size = 32;
  #   gtk.enable = true;
  # };
  # home.pointerCursor.size = 32;

  catppuccin = {
    enable = false; # Enable Globally
    flavor = "mocha";
    accent = "mauve";
    # pointerCursor.enable = true;
  };
  
  gtk = {
    enable = true;
    cursorTheme = {
      name = "catppuccin-mocha-mauve-cursors";
      size = 32;
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
    catppuccin = {
      enable = true;
      gnomeShellTheme = true;
      icon.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
    style.catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
      apply = true;
    };
  };

}
