{ lib, ... }: {

  programs.mangohud = {
    settings = {
      position = "top-right";
      frametime = 0;
      frame_timing = 0;
      round_corners = 10.0;
      hud_no_margin = true;
      table_columns = 2;

      # Stylix overrides
      background_alpha = lib.mkForce 0;
      font_size = lib.mkForce 20;
      font_size_text = lib.mkForce 20;
    };
  };

}
