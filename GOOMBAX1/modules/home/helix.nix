{ pkgs, ... }: {
  
  programs.helix = {
    package = pkgs.evil-helix;
    extraPackages = with pkgs; [
      marksman
      nixd
      vscode-css-languageserver
      vscode-json-languageserver
      taplo
    ];
  };

}
