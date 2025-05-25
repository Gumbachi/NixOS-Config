{ ... }: {

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "codeberg@gumbachi.com";
    extraConfig = {
      merge.ff = true;
    };
  };

  programs.gitui = {
    enable = true;
  };

}
