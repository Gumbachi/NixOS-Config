{ pkgs, ... }: {

  programs.chromium = {
    package = pkgs.ungoogled-chromium;
  };

}
