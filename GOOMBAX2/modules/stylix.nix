{ pkgs, ... }:

{
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
      package = pkgs.nerdfonts;
      name = "BlexMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.targets = {
    console.enable = true;
  };

  
  stylix.cursor = {
    package = pkgs.catppuccin-cursors.mochaPeach;
    name = "catppuccin-mocha-peach-cursors";
  };
}
