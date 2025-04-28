{ pkgs, ... }:
let
  fetchCursor = url: hash: name: pkgs.runCommand "moveUp" {} ''
    mkdir -p $out/share/icons
    ln -s ${pkgs.fetchzip {
      url = url;
      hash = hash;
    }} $out/share/icons/${name}
  '';
in
{

  # home.file.".local/share/icons/Bibata-Modern-Ice/".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice/";
  # home.file.".local/share/icons/catppuccin-mocha-mauve-cursors/".source = "${pkgs.catppuccin-cursors.mochaMauve}/share/icons/catppuccin-mocha-mauve-cursors/";
  # home.file.".local/share/icons/catppuccin-mocha-dark-cursors/".source = "${pkgs.catppuccin-cursors.mochaDark}/share/icons/catppuccin-mocha-dark-cursors/";
  # home.file.".local/share/icons/catppuccin-mocha-light-cursors/".source = "${pkgs.catppuccin-cursors.mochaLight}/share/icons/catppuccin-mocha-light-cursors/";

  home.file.".icons/catppuccin-mocha-blue-cursors/".source = "${pkgs.catppuccin-cursors.mochaBlue}/share/icons/catppuccin-mocha-blue-cursors/";
  home.file.".icons/Hypr-Bibata-Modern-Ice/".source = let
    url = "https://github.com/rtgiskard/bibata_cursor/releases/download/v1.0.0/Bibata-Modern-Ice.hypr.tar.zst";
    hash = "sha256-Ji5gqIBrAtFO3S9fCrY/LXPaq5gCY4CkxZJ1uAcjj70=";
    name = "Bibata-Modern-Ice";
  in "${fetchCursor url hash name}/share/icons/${name}";

}
