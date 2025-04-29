{ ... }: {

  programs.mangohud = {
    enable = true;
    settings = {
      position = "top-right";
      frametime = 0;
      frame_timing = 0;
      round_corners = 10.0;
      hud_no_margin = 0;
      background_alpha = 0;
      table_columns = 2;
    };
  };

}
