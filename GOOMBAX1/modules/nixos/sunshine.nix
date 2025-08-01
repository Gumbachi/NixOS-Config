{ ... }: {

  services.sunshine = {
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    settings = {
      output_name = 2;
    };
    applications = {
      env.PATH = "$(PATH):$(HOME)/.local/bin";
      apps = [
        {
          name = "Desktop";
          image-path = "desktop.png";
        }
        {
          name = "Low Res Desktop";
          image-path = "desktop.png";
          prep-cmd = [
            {
              do = "xrandr --output HDMI-1 --mode 1920x1080";
              undo = "xrandr --output HDMI-1 --mode 1920x1200";
            }
          ];
        }
        {
          name = "Steam Big Picture";
          detached = [ "setsid steam steam://open/bigpicture" ];
          image-path = "steam.png";
        }
      ];
    };
  };

}
