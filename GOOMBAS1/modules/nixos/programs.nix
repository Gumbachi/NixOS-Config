{ pkgs, ... }: {

  programs = {
    git.enable = true;
    tmux.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    helix
    btop
    yazi
    starship
    zoxide
    fzf
    ripgrep
    fd
  ];

}
