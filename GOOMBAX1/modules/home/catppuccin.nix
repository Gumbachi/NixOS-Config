{ pkgs, ... }: {

  catppuccin = {
    enable = false; # Enable Globally
    flavor = "mocha";
    accent = "mauve";
  };
  
  gtk = {
    enable = true;
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
