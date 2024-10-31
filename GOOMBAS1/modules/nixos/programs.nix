{ pkgs, ... }: {

  programs = {
    git.enable = true;
    tmux.enable = true;
    starship.enable = true;
    yazi.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    helix
    btop
    zoxide
    fzf
    ripgrep
    fd
  ];

}
