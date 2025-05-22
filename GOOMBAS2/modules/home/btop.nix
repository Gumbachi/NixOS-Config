{ ... }: {

  programs.btop = {
    settings = {
      shown_boxes = "cpu mem net proc gpu0";
    };
  };

}
