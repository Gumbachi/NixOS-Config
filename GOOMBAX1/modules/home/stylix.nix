{ pkgs, ... }: {

  stylix.enable = true;
  stylix.autoEnable = false;

  # Doesnt really work with hyprland just use hyprpaper
  stylix.image = ../../images/wallpapers/nix-gray.png;

  stylix.polarity = "dark";

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix.fonts = {
    serif = {
      package = pkgs.inter;
      name = "Inter";
    };

    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };

    monospace = {
      package = pkgs.nerd-fonts.blex-mono;
      name = "BlexMono Nerd Font";
    };

  };

  stylix.targets = {
    plymouth.enable = true;
    console.enable = true;
    gtk.enable = true;
    qt.enable = true;
    mangohud.enable = true;
    grub.enable = true;
  };

  stylix.cursor = {
    package = pkgs.catppuccin-cursors.mochaMauve;
    name = "catppuccin-mocha-mauve-cursors";
    size = 32;
  };

}
