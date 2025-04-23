{ ... }: {

  programs.rofi = {
    enable = true;
    extraConfig = {
      configuration = {
        modi = "drun";
        icon-theme = "Papirus";
        show-icons = true;
        terminal = "kitty";
        drun-display-format = "{icon} {name}";
        location = 0;
        disable-history = false;
        hover-select = true;
        me-select-entry = "";
        me-accept-entry = "MousePrimary";
        hide-scrollbar = true;
        display-drun = "";
        display-run = "   Run ";
        display-window = " 󰕰  Window";
        display-Network = " 󰤨  Network";
        sidebar-mode = false;
      };
    };
  };

}
